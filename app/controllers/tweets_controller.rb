class TweetsController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  # ログインしてなければ投稿はできずログイン画面にとばす
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
   if @tweet.save
      redirect_to root_path
      # 保存成功ならTOPにとばす
   else
      render :new
      # 失敗ならエラー文付近にとばす
   end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:style_name, :text, :image)
  end

end