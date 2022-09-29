class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.text :description, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
