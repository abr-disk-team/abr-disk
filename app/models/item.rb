class Item < ApplicationRecord

    belongs_to :label
    belongs_to :artist
    belongs_to :genre
    has_many :discs, dependent: :destroy
    has_many :cart_items

	validates :price, presence: true
	validates :stock, presence: true
	validates :genre_id, presence: true
	validates :artist_id, presence: true
	validates :label_id, presence: true
	validates :cd_name, presence: true


    attachment :jacket_image
    accepts_nested_attributes_for :discs, allow_destroy: true

end
