class AddprotoToImages < ActiveRecord::Migration
  def change
    add_reference :images, :prototype, index: true
  end
end
