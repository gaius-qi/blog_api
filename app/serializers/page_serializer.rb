class PageSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :created_at, :updated_at, :summary, :created, :updated
end
