class LikesController < ApplicationController

	before_action :authenticate_user!
	before_action :shop_params
	# ログイン済ユーザーのみにアクセスを許可する

	def like
		like = Like.create(user_id: current_user.id, shop_id: @shop.id)
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移せずLikeを行う
	end

	def unlike
		like = Like.find_by(user_id: current_user.id, shop_id: @shop.id).destroy
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移せずUnlikeを行う
	end

	private

	def shop_params
		@shop = Shop.find(params[:id])
	end

end