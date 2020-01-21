class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.text :description
      t.integer :capacity
      t.string :price

      t.timestamps
    end
  end
end
