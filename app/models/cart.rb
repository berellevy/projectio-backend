class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, as: :itemable


  def add_item(id, quantity = 1)
    cart_item = self.get_cart_item_by_item_id(id)
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
    self.cart_items.find_by(item_id: id)
  end

  def total
    total = cart_items.sum { |ci| ci.line_total_price }
  end

  def tax
    total * 0.75
  end

  def total_with_tax
    total + tax
  end

  def total_items
    cart_items.sum { |ci| ci.quantity }
  end
  
  
  def cart_totals
    {total: total, tax: tax, total_with_tax: total_with_tax }
  end

  def make_purchase
    if cart_items.length > 0 
      p = Purchase.create(user: self.user)
      p.cart_items = self.cart_items
      return p.display_purchase
    else
      return {error: "No items to purchase"}
    end
  end 
  

  def display_cart
    items = cart_items.map {|cart_item| cart_item.display_line}
    totals = cart_totals
    {items: items, totals: totals}
  end



end
