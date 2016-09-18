class AddIndexToRoomsRommid < ActiveRecord::Migration[5.0]
  def change
    add_index :rooms, :rommid, unique: true
  end
end
