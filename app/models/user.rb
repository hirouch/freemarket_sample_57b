class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
  has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'
  has_many :items
  has_one   :card
  has_one :address
  accepts_nested_attributes_for :address
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
