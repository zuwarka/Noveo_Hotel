# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
