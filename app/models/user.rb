class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # gem paranoiaの設定
  acts_as_paranoid
  # アソシエーションの記載
  has_many :addresses
  has_many :cart_items
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders
  # has_many :contacts
end
