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

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  # フォローを取得する
  # フォロワーを取得する
  # 自分がフォローしている人を取得する
  # 自分をフォローしている人を取得する

  enum is_active: {Available: true, Invalid: false}
  # 有効会員はtrue、退会済み会員はfalse

  attachment :profile_image, destroy: false

  def liked_by?(shop_id)
    likes.where(shop_id: shop_id).exists?
  end

  # def active_for_authentication?
  #   super && (self.is_active == "Available")
  # end
  # is_activeが有効の場合は有効会員(ログイン可能)

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

end
