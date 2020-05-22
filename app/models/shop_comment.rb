class ShopComment < ApplicationRecord

	belongs_to :user
	belongs_to :shop
	# shop_commentは1対NのN側(userに対して複数存在する)

end
