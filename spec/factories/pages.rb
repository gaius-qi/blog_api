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

FactoryGirl.define do
  factory :page do
    
  end
end
