class User < ApplicationRecord
  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_LAST_NAME =                 /\A[一-龥ぁ-ん]/
  VALID_EMAIL_LAST_NAME_KANA =                 /\A[ァ-ヶー－]+\z/
  VALID_EMAIL_PHONE_NUMBER =                 /\A\d{10,11}\z/
  validates :nickname,                presence: true, length: {maximum: 20}, on: :step2
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :step2
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}, on: :step2
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128}, on: :step2
  validates :last_name,               presence: true, on: :step2
  validates :first_name,              presence: true, on: :step2
  validates :last_name_kana,          presence: true, on: :step2
  validates :first_name_kana,         presence: true, on: :step2
  validates :birthdate_year,          presence: true, on: :step2
  validates :birthdate_month,         presence: true, on: :step2
  validates :birthdate_day,           presence: true, on: :step2
  validates :phone_number,            uniqueness: true, format: { with: VALID_EMAIL_PHONE_NUMBER }, on: :step3


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
