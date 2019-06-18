class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # gem paranoiaの設定
  acts_as_paranoid
  # アソシエーションの記載
  has_many :another_addresses
  has_many :carts
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # has_many :contacts
end
