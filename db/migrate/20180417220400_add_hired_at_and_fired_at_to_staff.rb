class AddHiredAtAndFiredAtToStaff < ActiveRecord::Migration[5.1]
  def change
    add_column :polyclinic_staffs, :hired_at, :date
    add_column :polyclinic_staffs, :fired_at, :date
    add_column :hospital_staffs, :hired_at, :date
    add_column :hospital_staffs, :fired_at, :date
  end
end
