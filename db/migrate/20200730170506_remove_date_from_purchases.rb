class RemoveDateFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :date
  end
end
