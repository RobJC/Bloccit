class AddUserToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :interger
    add_index :comments, :user_id
  end
end
