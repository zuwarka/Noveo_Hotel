# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
