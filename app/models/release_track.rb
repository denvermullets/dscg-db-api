class ReleaseTrack < ApplicationRecord
  self.table_name = 'release_track'

  belongs_to :release
  has_many :release_track_artists, foreign_key: :track_id, primary_key: :track_id
end
