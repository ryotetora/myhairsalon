class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    # add_column :users, :salon_name, :string, after: :encrypted_password
    add_column :users, :like_style, :string, after: :salon_name
    add_column :users, :salon_hp, :string, after: :like_style
    add_column :users, :prefecture, :string, after: :salon_hp
    add_column :users, :phone, :string, after: :prefecture
  end
end
