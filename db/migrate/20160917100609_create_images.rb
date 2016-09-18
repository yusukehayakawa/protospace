class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image
      t.integer :prototype_id
      t.integer :status
      t.timestamps
    end
  end
end
