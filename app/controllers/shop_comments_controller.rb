class ShopCommentsController < ApplicationController
	
	before_action :authenticate_user!

	def create
		shop = Shop.find(params[:shop_id])
		shop_comment = Shopcomment.new(shop_comment_params)
		shop_comment.user_id = current_user.id
		shop_comment.shop_id = shop.id
		shop_comment.save
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	def destroy
		shop = Shop.find(params[:shop_id])
		shop_comment =Comment.find_by(user_id: current_user.id, shop_id: params[:shop_id])
		shop_comment.user_id = current_user.id
		shop_comment.shop_id = shop.id
		shop_comment.destory
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	private

	def shop_comment_params
		params.require(:shop_comment).permit(:comment)
	end

end
