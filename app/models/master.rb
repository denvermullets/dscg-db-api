class Master < ApplicationRecord
  self.table_name = 'master'
  self.primary_key = :id

  has_many :master_artists, foreign_key: :master_id
  has_many :master_genres, foreign_key: :master_id
  has_many :master_styles, foreign_key: :master_id
  has_many :master_images, foreign_key: :master_id
  has_many :master_videos, foreign_key: :master_id
  has_many :releases, foreign_key: :master_id
end
