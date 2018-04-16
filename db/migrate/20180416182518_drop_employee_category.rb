class DropEmployeeCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column   :employees, :employee_category_id, :integer
    drop_table :employee_categories do |t|
      t.string :type
      t.integer :level
      t.integer :salary_incrase
      t.integer :vacation
      t.integer :danger
      t.integer :operation_count
      t.integer :operation_fails
      t.timestamps
    end

    add_column      :employees, :specialty, :string
    add_column      :employees, :level, :integer
    remove_column   :employees, :count_operations, :integer
    remove_column   :employees, :operation_fails, :integer
    add_column :patient_cards, :operations_success, :integer
    add_column :patient_cards, :operations_fails, :integer

  end
end
