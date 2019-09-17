class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  # validates :address_last_name,               presence: true
  # validates :address_first_name,              {presence: true}
  # validates :address_last_name_kana,          {presence: true}
  # validates :address_first_name_kana,         {presence: true}
  # validates :address_number,          {presence: true}
  # validates :address_prefecture,         {presence: true}
  # validates :address_name,           {presence: true}
  # validates :address_block,          {presence: true}
  # validates :address_building,         {presence: true}
  # validates :address_phone_number,           {presence: true}
end
