class ArtistUrl < ApplicationRecord
  self.table_name = 'artist_url'

  belongs_to :artist
end
