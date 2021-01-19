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


  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path
    # 編集保存成功すれば、詳細にとばす
    else
    render :edit
    # 失敗すれば編集冒頭にとばす
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to root_path
      # 削除に成功すればrootにとばす
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:style_name, :text, :image)
  end

end