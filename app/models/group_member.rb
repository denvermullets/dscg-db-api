class GroupMember < ApplicationRecord
  self.table_name = 'group_member'
  self.primary_key = nil

  belongs_to :group, class_name: 'Artist', foreign_key: :group_artist_id
  belongs_to :member, class_name: 'Artist', foreign_key: :member_artist_id
end
