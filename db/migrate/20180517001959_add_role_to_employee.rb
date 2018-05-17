class AddRoleToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :role, :string, default: 'user', null: false
  end
end
