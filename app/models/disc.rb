class Disc < ApplicationRecord

    belongs_to :item
    has_many :songs

    accepts_nested_attributes_for :songs, allow_destroy: true
end
