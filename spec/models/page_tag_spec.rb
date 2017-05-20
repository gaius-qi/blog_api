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

require 'rails_helper'

RSpec.describe PageTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
