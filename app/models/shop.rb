class Shop < ApplicationRecord

	validates :shop_name, presence: true, uniqueness: true
	validates :caption, presence: :true, length: {maximum: 150}
	validates :address, presence: true
	# shop_nameは空白と重複が不可
	# captionは空白が不可と文字数150文字以内
	# addressは空白が不可

	belongs_to :user

	has_many :shop_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	# shopは1対Nの1側(複数のNを所持する)
	# class shopが削除された際は上記も削除される(dependent: :destroy)

end
