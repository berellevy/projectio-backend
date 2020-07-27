class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def add_item(item, quantity = 1)
    cart_item = get_cart_item_by_item(item)
    if cart_item
      cart_item.quantity += quantity
      cart_item.save
    else
      cart_items.create(item: item)
    end
    
  end

  def get_cart_item_by_item(item)
    cart_item = cart_items.find_by(item_id: item.id)
  end

  

  
  


end
