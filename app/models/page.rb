# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  content     :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  summary     :text
#  category    :integer
#  click_count :integer
#  created     :datetime
#  updated     :datetime
#

class Page < ApplicationRecord
  belongs_to :user
  has_many :page_tags
  has_many :tags, through: :page_tags, foreign_key: :page_id

  after_save :clear_cache

  PAGE_CATEGORY = ['前端', '后端', '语言', '新闻', '生活']
  #一页四篇
  PAGE_PAGINATION = 4

  def get_category
    PAGE_CATEGORY[self.category]
  end

  def set_category category
    num = PAGE_CATEGORY.index(category)
    self.update(category: num)
  end

  private
    def clear_cache
      $redis.del "pages"
    end
end
