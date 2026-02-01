class Artist < ApplicationRecord
  self.table_name = 'artist'
  self.primary_key = :id

  has_many :artist_aliases, foreign_key: :artist_id
  has_many :artist_images, foreign_key: :artist_id
  has_many :artist_namevariations, foreign_key: :artist_id
  has_many :artist_urls, foreign_key: :artist_id
  has_many :group_memberships, class_name: 'GroupMember', foreign_key: :member_artist_id
  has_many :members, class_name: 'GroupMember', foreign_key: :group_artist_id
  has_many :master_artists, foreign_key: :artist_id
  has_many :masters, through: :master_artists
end
