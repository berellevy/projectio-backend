class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image1, :image2
end
