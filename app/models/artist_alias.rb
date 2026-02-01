class ArtistAlias < ApplicationRecord
  self.table_name = 'artist_alias'
  self.primary_key = nil

  belongs_to :artist
end
