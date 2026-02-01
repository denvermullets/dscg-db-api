class LabelUrl < ApplicationRecord
  self.table_name = 'label_url'

  belongs_to :label
end
