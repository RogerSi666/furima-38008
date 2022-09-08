class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :category_id 
      t.integer :price
      t.integer :post_price_id
      t.text :information
      t.integer :quality_id
      t.integer :prefecture_id
      t.integer :shipment_day_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
