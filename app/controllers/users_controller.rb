class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      bypass_sign_in(@user)
      # 編集時の自動ログアウトを防ぐ
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    # @tweet = Tweet.find(params[:id])
    @nickname = current_user.nickname
    @tweets = current_user.tweets
# マイページに表示したい情報を変数化
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :salon_name, :like_style, :salon_hp, :prefecture, :phone, :img)
  end
end
