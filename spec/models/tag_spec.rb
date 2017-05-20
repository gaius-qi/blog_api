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

require 'rails_helper'

RSpec.describe Tag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
