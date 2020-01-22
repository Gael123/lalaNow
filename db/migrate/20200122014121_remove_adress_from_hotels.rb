class RemoveAdressFromHotels < ActiveRecord::Migration[6.0]
  def change

    remove_column :hotels, :adress, :string
  end
end
