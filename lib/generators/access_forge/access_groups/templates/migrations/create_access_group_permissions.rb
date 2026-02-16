class CreateAccessGroupPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :access_group_permissions do |t|
      t.references :access_group, foreign_key: true
      t.references :permission, foreign_key: true

      t.timestamps
    end
  end
end

