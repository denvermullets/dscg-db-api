class ReleaseArtist < ApplicationRecord
  self.table_name = 'release_artist'

  belongs_to :release
  belongs_to :artist
end
