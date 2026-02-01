class LabelImage < ApplicationRecord
  self.table_name = 'label_image'
  self.primary_key = nil

  belongs_to :label
end
