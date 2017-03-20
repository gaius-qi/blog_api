# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  name                 :string
#  email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  admin                :boolean          default("false")
#  activated            :datetime
#  authentication_token :string
#  password_digest      :string
#

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
  end
end
