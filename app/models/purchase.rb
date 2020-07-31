class Purchase < ApplicationRecord
  belongs_to :user
  has_many :cart_items, as: :itemable
  accepts_nested_attributes_for :cart_items

  def total
    total = cart_items.sum { |ci| ci.line_total_price }
  end

  def tax
    total * 0.75
  end

  def total_with_tax
    total + tax
  end

  def purchase_totals
    {total: total, tax: tax, total_with_tax: total_with_tax }
  end
  
  
  def display_purchase
    items = cart_items.map {|cart_item| cart_item.display_line}
    totals = purchase_totals
    {items: items, totals: totals}
  end
end