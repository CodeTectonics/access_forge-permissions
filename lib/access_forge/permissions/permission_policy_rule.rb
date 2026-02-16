# frozen_string_literal: true

module AccessForge
  module Permissions
    class PermissionPolicyRule
      def self.authorized?(user, _controller, options)
        user.permissions.exists?({ permissions: { name: options[:permission] } })
      end
    end
  end
end
