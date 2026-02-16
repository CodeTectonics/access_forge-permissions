class CreateAccessGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :access_groups do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end

