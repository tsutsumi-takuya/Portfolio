class Like < ApplicationRecord
	
	belongs_to :user
	belongs_to :shop
	# likeは1対NのN側(userに対して複数存在する)

end
