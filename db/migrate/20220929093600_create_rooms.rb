class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.boolean :booked, null: false, default: false

      t.timestamps
    end
  end
end
