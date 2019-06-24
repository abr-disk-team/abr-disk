class Cart < ApplicationRecord

    has_many :cart_items
    belongs_to :user
    has_one :order    
    has_many :items, through: CartItem
end
