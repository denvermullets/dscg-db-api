class ReleaseCompany < ApplicationRecord
  self.table_name = 'release_company'

  belongs_to :release
end
