class ShopComment < ApplicationRecord

	validates :shop_comment, presence: :true, length: {maximum: 30}
	# shop_commentは空白が不可、文字数30文字未満

	belongs_to :user
	belongs_to :shop
	# shop_commentは1対NのN側(userに対して複数存在する)
	
end
