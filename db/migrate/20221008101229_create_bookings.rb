# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :people, null: false
      t.integer :room_id, null: false
      t.index ['room_id'], name: 'index_bookings_on_room_id'

      t.timestamps
    end
  end
end
