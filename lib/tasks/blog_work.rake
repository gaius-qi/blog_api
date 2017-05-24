namespace :blog_work do
  #将redis中pages_click哈希（文章对应点击数）持久化数据库pages表中
  task :click_update => [:environment] do
    pages_click = $redis.hgetall("pages_click")
    pages_click.each do |key, value|
      begin
        page = Page.find_by(id: key.to_i)
        page.update(click_count: value.to_i)
      rescue => e
        Rails.logger.error("something is wrong: #{e.message}")
        p "#{key}===============#{e.message}"
      end
    end
  end
end
