# == Schema Information
#
# Table name: page_tags
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :integer          not null
#  tag_id     :integer          not null
#

class PageTag < ApplicationRecord
  belongs_to :page
  belongs_to :tag
end
