class Disc < ApplicationRecord

    belongs_to :item
    has_many :songs
end
