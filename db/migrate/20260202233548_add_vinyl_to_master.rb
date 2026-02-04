class AddVinylToMaster < ActiveRecord::Migration[8.1]
  def change
    add_column :master, :vinyl, :boolean, default: false, null: false
  end
end
