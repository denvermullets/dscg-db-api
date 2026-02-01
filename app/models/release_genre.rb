class ReleaseGenre < ApplicationRecord
  self.table_name = 'release_genre'

  belongs_to :release
end
