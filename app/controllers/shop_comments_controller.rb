class ShopCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		shop = Shop.find(params[:shop_id])
		shop_comment = current_user.shop_comments.new(shop_comment_params)
		shop_comment.shop_id = shop.id
		shop_comment.save
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	def destroy
		ShopComment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
		redirect_back(fallback_location: root_path)
		# 他の画面に遷移しない
	end

	private

	def shop_comment_params
		params.require(:shop_comment).permit(:comment)
	end

end