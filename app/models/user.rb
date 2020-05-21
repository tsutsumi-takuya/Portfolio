class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: :true, uniqueness: :true
  # validates :introduction, presence: :true, uniqueness: :true
  # nameは空白と重複が不可
  # introductionは空白と重複が不可

	has_many :shops, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :shop_comments, dependent: :destroy
	# userは1対Nの1側(複数のNを所持する)
	# class userが削除された際は上記も削除される(dependent: :destroy)

  enum active: {登録済み: true, 退会済み: false}
   #enumで退会済みのユーザーはログイン不可にする
end
