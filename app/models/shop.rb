class Shop < ApplicationRecord

	belongs_to :user

	has_many :shop_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	# shopは1対Nの1側(複数のNを所持する)
	# class shopが削除された際は上記も削除される(dependent: :destroy)

	attachment :shop_image, destroy: false

	validates :shop_name, presence: true
	validates :address, presence: true
	validates :caption, presence: true

end
