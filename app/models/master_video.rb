class MasterVideo < ApplicationRecord
  self.table_name = 'master_video'

  belongs_to :master
end
