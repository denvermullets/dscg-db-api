class MasterImage < ApplicationRecord
  self.table_name = 'master_image'
  self.primary_key = nil

  belongs_to :master
end
