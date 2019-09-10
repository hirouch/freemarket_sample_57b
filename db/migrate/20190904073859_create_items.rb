class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :delivery_cost, null: false
      t.integer :delivery_way, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_date, null: false
      t.string :size
      t.string :brand
      t.integer :seller_id
      t.integer :buyer_id
      
      t.timestamps
    end
  end
end
