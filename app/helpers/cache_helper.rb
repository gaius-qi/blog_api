module CacheHelper

  #fetch all pages
  def fetch_pages_all
    pages = $redis.get('pages')
    full_pages = []

    if pages.nil?
      pages = Page.all.sort{|x, y| y.created <=> x.created}

      pages.map do |page|
        tags = page.tags.pluck(:name)
        full_pages << {
                         category: page.category,
                         click_count: page.click_count,
                         content: page.content,
                         content_html: page.content_html,
                         created: page.created,
                         id: page.id,
                         summary: page.summary,
                         title: page.title,
                         updated: page.updated,
                         user_id: page.user_id,
                         tags: tags
                       }
      end

      pages = full_pages.to_json
      $redis.set('pages', pages)
      $redis.expire('pages',1.month.to_i)
    end

    @pages = JSON.load pages
  end

  # 时间段和对应文章数(归档)
  def fetch_pages_date
    date_table = {}
    pages = fetch_pages_all
    pages.each do |page|
      date = page["created"].slice(0, 4) + page["created"].slice(5, 2)
      if date_table["#{date}"].nil?
        date_table["#{date}"] = 1
      else
        date_table["#{date}"] += 1
      end
    end
    date_table = date_table.sort_by{|k, v| k}.reverse
  end

  #分页，返回对应页码的所有文章 Page::PAGE_PAGINATION为一页多少篇
  def fetch_pages page_number
    pages = fetch_pages_all
    count_total = pages.count
    pages = pages.slice((page_number - 1) * Page::PAGE_PAGINATION, Page::PAGE_PAGINATION)
    count = pages.count
    category_count = Page::PAGE_CATEGORY.count

    {
      "data": {
        "meta": {
          "page_count_total": count_total,
          "page_count": count,
          "category_count": category_count
        },
        "attributes": pages
      }
    }
  end

  #fetch对应某文章的内容
  def fetch_page page_number
    pages = fetch_pages_all
    page = pages.find{|page| page["id"] === page_number}
  end

  #fetch所有tags的name
  def fetch_tags
    tags = $redis.get('tags')
    if tags.nil?
      tags = Tag.pluck(:name).to_json
      $redis.set('tags', tags)
      $redis.expire('tags',3.hour.to_i)
    end
    @tags = JSON.load tags
  end

  #fetch对应tag的所有文章
  def fetch_tag_pages tag_name
    pages = fetch_pages_all
    page = pages.select do |x|
      x["tags"].include? tag_name
    end
  end

  #fetch对应时间段的所有文章(归档点击时间段，返回的所有文章内容)
  def fetch_archive_pages date
    pages = fetch_pages_all
    pages = pages.select do |x|
      (x["created"].slice(0, 4) + x["created"].slice(5, 2)) == date
    end
  end

  def fetch_category_pages category
    pages = fetch_pages_all
    pages = pages.select do |x|
      x["category"] === category
    end
  end

  #将数据库pages表中所有文章和对应的点击数，存储到redis中pages_click哈希中
  def save_all_pages_click
    pages_click = Page.pluck(:id, :click_count).flatten
    $redis.del("pages_click")
    $redis.hmset("pages_click", pages_click)
  end

  #浏览文章时，增加该文章点击数
  def touch_click_page page_number
    pages_click_count = $redis.hlen("pages_click")
    if pages_click_count === 0
      save_all_pages_click
    end

    click_count = $redis.hget("pages_click", page_number)
    if click_count.empty? || click_count.nil?
      click_count = 1
    else
      click_count = click_count.to_i + 1
    end

    $redis.hset("pages_click", page_number, click_count)
  end

  #取对应文章的点击数
  def get_page_click_count page_number
    pages_click_count = $redis.hlen("pages_click")
    if pages_click_count === 0
      save_all_pages_click
    end

    click_count = $redis.hget("pages_click", page_number)
  end
end
