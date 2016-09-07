class LinkSerializer < ActiveModel::Serializer
  attributes :id, :text, :href
  belongs_to :page
end
