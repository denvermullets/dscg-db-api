class AddIngestedToMaster < ActiveRecord::Migration[8.1]
  def change
    add_column :master, :ingested, :boolean, default: false, null: false
  end
end
