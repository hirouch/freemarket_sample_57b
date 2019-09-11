class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  # belongs_to :user, foreign_key: 'user_id'
  belongs_to :category

  belongs_to :seller ,class_name: "User", foreign_key: "seller_id"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  enum status: { new_thing: 0, near_unused: 1, no_damage: 2, little_damage: 3, damage: 4, bad_thing: 5 }
  enum delivery_cost: { postage_included: 0, cash_on_delivery: 1 }
  enum delivery_way: { undecided: 0, mercari_bin: 1, yu_mail: 2, letter_pack: 3, regular_mail: 4, kuroneko: 5, yu_pack: 6, click_post: 7, yu_packet: 8 }
  enum delivery_date: { ship_in_1to2days: 0, ship_in_2to3days: 1, ship_in_4to7days:2 }
end
