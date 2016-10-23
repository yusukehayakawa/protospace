class AddForeignKeyToLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :prototype_id, :integer
    remove_column :likes, :user_id, :integer

  end
end
