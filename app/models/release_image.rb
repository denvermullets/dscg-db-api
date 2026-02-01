class ReleaseImage < ApplicationRecord
  self.table_name = 'release_image'
  self.primary_key = nil

  belongs_to :release
end
