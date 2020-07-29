class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def add_item(id, quantity = 1)
    cart_item = get_cart_item_by_item_id(id)
    if cart_item
      cart_item.quantity += quantity
      cart_item.save
    else
      cart_items.create(item_id: id)
    end
  end

  def delete_item(id)
    cart_item = get_cart_item_by_item_id(id)
    cart_item.destroy
  end


  def get_cart_item_by_item_id(id)
    cart_item = cart_items.find_by(item_id: id)
  end

  def total
    cart_items.sum { |ci| ci.line_total_price }
  end

  def tax
    total * 0.75
  end

  def total_with_tax
    total + tax
  end
  
  

  def display_cart
    items = cart_items.map {|cart_item| cart_item.display_line}
    totals = {total: total, tax: tax, total_with_tax: total_with_tax }
    {items: items, totals: totals}
  end



end
