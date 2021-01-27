class CommentsController < ApplicationController
  def create
    comment = Comment.create(coment_params)
    redirect_to "/tweets/#{comment.tweet.id}"
    # コメントしたら同じ詳細画面に戻る
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end
