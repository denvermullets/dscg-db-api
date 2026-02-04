class ReleaseIdentifier < ApplicationRecord
  self.table_name = 'release_identifier'
  self.inheritance_column = nil

  belongs_to :release
end
