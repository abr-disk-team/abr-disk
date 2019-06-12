class Contact < ApplicationRecord
	# belongs_to :user

	validates :category, presence: true
	validates :contact_content, presence: true
	validates :contact_content, length: {minimum: 1}
	validates :contact_content, length: {maximum: 200}
end
