class AddCityToClinic < ActiveRecord::Migration[5.1]
  def change
    rename_column :employees, :operation_count, :count_operations
    add_column :polyclinics, :city, :string
  end
end
