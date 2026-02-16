require "rails/generators"
require "rails/generators/named_base"
require "rails/generators/migration"

module AccessForge
  module Generators
    class AccessGroupsGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("templates", __dir__)

      desc "Creates the necessary models and mirations for access-group authorisation."

      def create_models
        template "access_group.rb", "app/models/access_group.rb"
        template "permission.rb", "app/models/permission.rb"
        template "access_group_permission.rb", "app/models/access_group_permission.rb"
        template "access_group_user.rb", "app/models/access_group_user.rb"
      end

      def create_migrations
        migration_template "migrations/create_access_groups.rb",
                           "db/migrate/create_access_groups.rb"

        migration_template "migrations/create_permissions.rb",
                           "db/migrate/create_permissions.rb"

        migration_template "migrations/create_access_group_permissions.rb",
                           "db/migrate/create_access_group_permissions.rb"

        migration_template "migrations/create_access_group_users.rb",
                           "db/migrate/create_access_group_users.rb"
      end

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          @@migration_number ||= Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          @@migration_number += 1
          @@migration_number.to_s
        else
          format("%03d", current_migration_number(dirname) + 1)
        end
      end
    end
  end
end
