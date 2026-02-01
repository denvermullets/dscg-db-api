class ReleaseLabel < ApplicationRecord
  self.table_name = 'release_label'

  belongs_to :release
end
