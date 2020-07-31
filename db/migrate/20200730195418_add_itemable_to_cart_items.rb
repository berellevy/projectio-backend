class AddItemableToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :cart_items, :itemable, polymorphic: true
  end
end
