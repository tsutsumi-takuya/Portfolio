class ShopComment < ApplicationRecord

	belongs_to :user
	belongs_to :shop
	# User、Shopモデルに対してbelongs_toの関連付け
	# shop_commentは1対NのN側(userに対して複数存在する)

	validates :comment, presence: true

end
