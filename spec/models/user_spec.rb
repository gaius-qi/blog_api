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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
