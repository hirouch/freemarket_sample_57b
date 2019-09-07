class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :address_last_name, null: false
      t.string :address_first_name, null: false
      t.string :address_last_name_kana, null: false
      t.string :address_first_name_kana, null: false
      t.string :address_number, null: false
      t.integer :address_prefecture, null: false, default: 0
      t.string :address_name, null: false
      t.string :address_block, null: false
      t.string :address_building
      t.string :address_phone_number
      t.timestamps
    end
  end
end
