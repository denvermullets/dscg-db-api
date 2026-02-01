class ArtistImage < ApplicationRecord
  self.table_name = 'artist_image'
  self.primary_key = nil

  belongs_to :artist
end
