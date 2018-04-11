class FixTypeForEmployeeCategory < ActiveRecord::Migration[5.1]
  def change
    rename_column :employee_categories, :type, :kind
  end
end
