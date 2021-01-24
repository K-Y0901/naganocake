class AddIsActiveToEndUser < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :is_active, :boolean, default: true, null: false
  end
end
