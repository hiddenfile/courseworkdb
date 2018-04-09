class MoveFromEmployeeCategoryToEmployee < ActiveRecord::Migration[5.1]
  def change
    remove_column :employee_categories, :operation_count, :integer
    remove_column :employee_categories, :operation_fails, :integer
    add_column    :employees, :operation_count, :integer
    add_column    :employees, :operation_fails, :integer
  end
end
