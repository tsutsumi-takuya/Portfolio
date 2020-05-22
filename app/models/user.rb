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
  # Relationshipモデルのfollower_idにuser_idを格納する
  # Relationshipモデルのfollowed_idにuser_idを格納する

  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followerd, source: :follower
  # 自分がfollowしているユーザーを取得、throughでfollwedの中間テーブルを指定
  # 自分をfollowしているユーザーを取得、throughでfollwerの中間テーブルを指定

  enum is_active: {有効: true, 退会済み: false}
  # 有効会員はtrue、退会済み会員はfalse

  def active_for_authentication?
    super && (self.is_active == "有効")
  end
  # is_activeが有効の場合は有効会員(ログイン可能)

  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  # ユーザーをフォローする場合

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  # ユーザーのフォローを外す場合

  def following?(user)
    following_user.include?(user)
  end
  # 既にユーザーをフォローしていればtrue

end
