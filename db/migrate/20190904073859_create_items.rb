class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :description, null: false
      t.references :category, foreign_key: true
      t.string :state, null: false
      t.string :size
      t.string :brand
      t.string :postage, null: false
      t.string :shipping_method
      t.string :region, null: false
      t.string :shipping_date, null: false
      t.integer :price, null: false
      t.integer :seller_id
      t.integer :buyer_id
      
      t.timestamps
    end
  end
end
