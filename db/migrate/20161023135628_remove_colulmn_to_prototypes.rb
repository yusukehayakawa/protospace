class RemoveColulmnToPrototypes < ActiveRecord::Migration
  def change
    remove_column :prototypes, :likes_count, :integer
  end
end
