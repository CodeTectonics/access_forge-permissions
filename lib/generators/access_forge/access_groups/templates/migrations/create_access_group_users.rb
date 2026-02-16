class CreateAccessGroupUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :access_group_users do |t|
      t.references :access_group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

