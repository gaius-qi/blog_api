class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin, :authentication_token, :activated, :created_at, :updated_at
end
