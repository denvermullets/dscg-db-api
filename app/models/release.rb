class Release < ApplicationRecord
  self.table_name = 'release'
  self.primary_key = :id

  belongs_to :master, optional: true
  has_many :release_artists, foreign_key: :release_id
  has_many :release_companies, foreign_key: :release_id
  has_many :release_formats, foreign_key: :release_id
  has_many :release_genres, foreign_key: :release_id
  has_many :release_styles, foreign_key: :release_id
  has_many :release_identifiers, foreign_key: :release_id
  has_many :release_images, foreign_key: :release_id
  has_many :release_labels, foreign_key: :release_id
  has_many :release_tracks, foreign_key: :release_id
  has_many :release_videos, foreign_key: :release_id
end
