class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :shops, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :shop_comments, dependent: :destroy
	# userは1対Nの1側(複数のNを所持する)
	# class userが削除された際は上記も削除される(dependent: :destroy)

  enum is_active: {有効: true, 退会済み: false}
  # 有効会員はtrue、退会済み会員はfalse

  def active_for_authentication?
    super && (self.is_active == "有効")
  end
  # is_activeが有効の場合は有効会員(ログイン可能)

end
