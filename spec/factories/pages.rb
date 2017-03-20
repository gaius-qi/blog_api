# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :page do
    
  end
end
