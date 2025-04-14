class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    drop_table :groups if table_exists?(:groups)
    
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :icon
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.datetime :created_at
      t.binary :icon_data, limit: 10.megabytes
    end
  end
end
