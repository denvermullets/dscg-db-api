class ReleaseVideo < ApplicationRecord
  self.table_name = 'release_video'

  belongs_to :release
end
