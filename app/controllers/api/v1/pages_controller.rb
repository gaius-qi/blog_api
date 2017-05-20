class Api::V1::PagesController < Api::ApplicationController

  def index
    @pages = fetch_pages_all
    render json: @pages
  end

  def show
    @pages = Page.find_by_id(params[:id])
    render json: @pages
  end

  def pages_date_total
    @date = fetch_pages_date
    render json: @date
  end

  def paging
    @pages = fetch_pages params[:page_number].to_i
    render json: @pages
  end

  private

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

end
