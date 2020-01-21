class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :adress
      t.integer :stars

      t.timestamps
    end
  end
end
