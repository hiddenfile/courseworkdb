class AddKindToWard < ActiveRecord::Migration[5.1]
  def change
    add_column :wards, :kind, :string
    add_column :wards, :employee_id, :integer
    rename_column :patient_cards, :begin, :start_at
    rename_column :patient_cards, :end, :end_at
  end
end
