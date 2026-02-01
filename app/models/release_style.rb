class ReleaseStyle < ApplicationRecord
  self.table_name = 'release_style'
  self.primary_key = nil

  belongs_to :release
end
