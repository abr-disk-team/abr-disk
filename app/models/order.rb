class Order < ApplicationRecord
      has_many :order_items
      belongs_to :user
      belongs_to :address
end
