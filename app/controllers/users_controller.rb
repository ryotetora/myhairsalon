class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @nickname = current_user.nickname
    @tweets = current_user.tweets
# マイページに表示したい情報を変数化
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
