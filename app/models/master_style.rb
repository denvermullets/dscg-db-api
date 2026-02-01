class MasterStyle < ApplicationRecord
  self.table_name = 'master_style'

  belongs_to :master
end
