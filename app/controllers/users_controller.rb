class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@shops = @user.shops
		# @userに紐付く@shops
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.update(user_params)
		if
			@user.save
			redirect_to user_path(@user.id)
			# @userがsaveされた場合、編集後のuserにpath
		else
			render action: :edit
			# 上記以外の場合、編集画面に戻る
		end
	end

	def goodbye
		@user = User.find(params[:id])
	end

	def bye
		@user = User.find(current_user.id)
		@user.update(is_active: "退会済み")
		reset_session
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:active, :name, :introduction, :profile_image)
	end
end
