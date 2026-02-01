class MasterGenre < ApplicationRecord
  self.table_name = 'master_genre'

  belongs_to :master
end
