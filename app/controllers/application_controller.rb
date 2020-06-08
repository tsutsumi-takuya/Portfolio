class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	# コントローラのフィルタリングを行う

	private

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
	end
	# ストロングパラメータの追加

	def after_sign_up_path_for(resource)
		shops_path
	end
	# 新規登録後の遷移先指定

	def after_sign_in_path_for(resource)
		shops_path
	end
	# ログイン後の遷移先指定

	def after_sign_out_path_for(resource)
		root_path
	end
	# ログアウト後の遷移先指定

end