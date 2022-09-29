class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :username, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
