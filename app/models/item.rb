class Item < ApplicationRecord
	# アソシエーションの記載
    belongs_to :label
    belongs_to :artist
    belongs_to :genre
    has_many :discs
    has_many :cart_items
    has_many :carts, through: CartItem
    has_many :favorites, dependent: :destroy
    has_many :reviews, dependent: :destroy

    attachment :jacket_image
    accepts_nested_attributes_for :discs, allow_destroy: true

    # userがいいねしているか確認するメソッド
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end
