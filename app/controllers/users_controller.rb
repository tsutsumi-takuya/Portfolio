class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
		@shops = @user.shops
		# @userに紐付く@shops
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find_by(:id params[:id])
		@user.update(user_params)
		if
			@user.save
			redirect_to user_path(@user.id)
			# @userがsaveされた場合、編集後のuserにpath
		else
			@users = User.all
			render action: :edit
			# 上記以外の場合、編集画面に戻る
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
