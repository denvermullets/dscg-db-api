class ArtistNamevariation < ApplicationRecord
  self.table_name = 'artist_namevariation'

  belongs_to :artist
end
