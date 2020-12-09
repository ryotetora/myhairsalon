class TweetsController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  # ログインしてなければ投稿はできずログイン画面にとばす
  def index
    @tweets = Tweet.all
  end

  def create
  end

  def show
  end
end
