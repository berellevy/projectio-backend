class ItemPurchaseSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  has_one :purchase
  has_one :item
end
