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

require 'rails_helper'

RSpec.describe Page, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
