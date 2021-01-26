class TweetsController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  # before_action :same_user_check, only: [:edit, :destroy]
  # ログインしてなければ投稿はできずログイン画面にとばす
  # リファクタリングこれから

  def index
    @tweets = Tweet.all.order('created_at DESC')
    #  全レコード情報をもつインスタンス変数を生成、並びを降順指定
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
    redirect_to root_path unless current_user.id == @tweet.user_id
    # ログインユーザーと投稿者が違うならTOPにとばす
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
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
    params.require(:tweet).permit(:style_name, :text, :image).merge(user_id: current_user.id)
  end
end