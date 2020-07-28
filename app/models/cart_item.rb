class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  validates :cart, uniqueness: { scope: :item }
  
  def line_total_price
  	item.price * quantity
  end

  def display_line
  	line = item.as_json()
  	line[:quantity] = quantity
  	line[:total_price] = line_total_price
  	line
  end

end
