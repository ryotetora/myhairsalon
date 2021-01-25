class AddUserIdToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :user_id, :integer,after: :text
    # 後付けでuser_idカラムの追加、並び指定
  end
end
