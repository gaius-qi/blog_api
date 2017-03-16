class Page < ApplicationRecord
  has_many :page_versions
  has_many :users, through: :page_versions
end
