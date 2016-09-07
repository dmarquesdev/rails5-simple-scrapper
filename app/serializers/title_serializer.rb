class TitleSerializer < ActiveModel::Serializer
  attributes :id, :tag, :content
  belongs_to :page
end
