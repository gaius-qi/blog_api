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

FactoryGirl.define do
  factory :tag do
    name "MyString"
    about "MyString"
  end
end
