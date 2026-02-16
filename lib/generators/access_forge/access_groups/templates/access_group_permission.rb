class AccessGroupPermission < ApplicationRecord
  belongs_to :access_group
  belongs_to :permission
end
