class Permission < ApplicationRecord
  has_many :access_group_permissions, dependent: :destroy
  has_many :access_groups, through: :access_group_permissions
  has_many :users, through: :access_groups

  validates :name, presence: true, uniqueness: true
end
