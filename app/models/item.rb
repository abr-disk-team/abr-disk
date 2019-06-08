class Item < ApplicationRecord

    belongs_to :label
    belongs_to :artist
    belongs_to :genre
    has_many :discs
    has_many :carts

    attachment :jacket_image
    accepts_nested_attributes_for :discs, allow_destroy: true

end
