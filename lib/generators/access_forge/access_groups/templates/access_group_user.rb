class AccessGroupUser < ApplicationRecord
  belongs_to :access_group
  belongs_to :user
end
