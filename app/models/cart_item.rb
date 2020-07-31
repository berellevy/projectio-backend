class CartItem < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  belongs_to :item
  validates :itemable_type, :itemable_id, presence: true
  validates :item, uniqueness: { scope: [:itemable_type, :itemable_id] }
  
  
  
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
