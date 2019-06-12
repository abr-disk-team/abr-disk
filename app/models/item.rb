class Item < ApplicationRecord

    belongs_to :label
    belongs_to :artist
    belongs_to :genre
    has_many :discs
    has_many :cart_items
    

    attachment :jacket_image
    accepts_nested_attributes_for :discs, allow_destroy: true

end
