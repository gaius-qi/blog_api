# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  about      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Tag < ApplicationRecord
  has_many :page_tags
  has_many :pages, through: :page_tags, foreign_key: :tag_id

  after_save :clear_cache

  def clear_cache
    $redis.del "tags"
    $redis.del "pages"
  end
end
