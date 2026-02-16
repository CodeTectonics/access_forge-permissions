class AccessGroup < ApplicationRecord
  has_many :access_group_permissions, inverse_of: :access_group, dependent: :destroy
  has_many :permissions, through: :access_group_permissions
  has_many :access_group_users, inverse_of: :access_group, dependent: :destroy
  has_many :users, through: :access_group_users

  validates :name, presence: true, uniqueness: true
end
