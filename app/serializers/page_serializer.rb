class PageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :titles
  has_many :links
end
