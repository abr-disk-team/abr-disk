class Item < ApplicationRecord

    belongs_to :label
    belongs_to :artist
    belongs_to :genre
    has_many :discs
end
