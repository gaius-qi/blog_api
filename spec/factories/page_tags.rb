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

FactoryGirl.define do
  factory :page_tag do
    page_id 1
    tag_id 1
    content "MyString"
  end
end
