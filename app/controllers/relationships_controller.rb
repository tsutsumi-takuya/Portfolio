class RelationshipsController < ApplicationController

	before_action :authenticate_user!
    # ログイン済ユーザーのみにアクセスを許可する

    def follow
        current_user.follow(params[:id])
        redirect_back(fallback_location: root_path)
    end
    # 他の画面に遷移せずfollowを行う

    def unfollow
        current_user.unfollow(params[:id])
        redirect_back(fallback_location: root_path)
    end
    # 他の画面に遷移せずunfollowを行う

end