class AddIngestedToArtist < ActiveRecord::Migration[8.1]
  def change
    add_column :artist, :ingested, :boolean, default: false, null: false
  end
end
