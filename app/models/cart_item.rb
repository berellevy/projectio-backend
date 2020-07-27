class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  validates :cart, uniqueness: { scope: :item }
  


end
