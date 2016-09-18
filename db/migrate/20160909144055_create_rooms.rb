class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :rommid
      t.string :build
      t.integer :size
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
