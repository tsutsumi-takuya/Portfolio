class LikesController < ApplicationController
	
	def create
		like = Like.new(user_id: current_user.id, shop_id: params[:shop_id])
		like.save
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	def destroy
		like = Like.find_dy(user_id: current_user.id, shop_id: params[:shop_id])
		likes.destroy
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

end
