class MasterArtist < ApplicationRecord
  self.table_name = 'master_artist'

  belongs_to :master
  belongs_to :artist
end
