class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.text :catch_copy
      t.text :concept
      t.timestamps
    end
  end
end
