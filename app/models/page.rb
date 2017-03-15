class Page < ApplicationRecord
  has_many :versions, class_name: 'PageVersion'
end
