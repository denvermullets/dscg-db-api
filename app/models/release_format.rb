class ReleaseFormat < ApplicationRecord
  self.table_name = 'release_format'

  belongs_to :release
end
