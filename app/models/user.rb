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

class User < ApplicationRecord
  has_secure_password

  before_create :generate_authentication_token

  has_many :pages

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end

  def reset_auth_token!
    generate_authentication_token
    save(validate: false)
  end

end
