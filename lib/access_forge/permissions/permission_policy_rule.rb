# frozen_string_literal: true

module AccessForge
  module Permissions
    class PermissionPolicyRule
      def self.authorized?(user, _controller, options)
        permission_name = "Can #{options[:verb]} #{options[:feature]}"
        user.permissions.exists?({ permissions: { name: permission_name } })
      end
    end
  end
end
