class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :description
      t.string :image1
      t.string :image2

      t.timestamps
    end
  end
end
