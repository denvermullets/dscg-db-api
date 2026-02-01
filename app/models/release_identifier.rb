class ReleaseIdentifier < ApplicationRecord
  self.table_name = 'release_identifier'

  belongs_to :release
end
