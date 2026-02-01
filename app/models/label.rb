class Label < ApplicationRecord
  self.table_name = 'label'
  self.primary_key = :id

  belongs_to :parent, class_name: 'Label', foreign_key: :parent_id, optional: true
  has_many :sublabels, class_name: 'Label', foreign_key: :parent_id
  has_many :label_images, foreign_key: :label_id
  has_many :label_urls, foreign_key: :label_id
end
