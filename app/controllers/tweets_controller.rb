class TweetsController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  # ログインしてなければ投稿はできずログイン画面にとばす
  def index
  end

  def create
  end

  def show
  end
end
