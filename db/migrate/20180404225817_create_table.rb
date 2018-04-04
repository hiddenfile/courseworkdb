class CreateTable < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    create_table :employee_categories do |t|
      t.string :type
      t.integer :level
      t.integer :salary_incrase
      t.integer :vacation
      t.integer :danger
      t.integer :operation_count
      t.integer :operation_fails
      t.timestamps
    end

    create_table :hospitals do |t|
      t.string :name
      t.string :city
      t.timestamps
    end

    create_table :laboratories do |t|
      t.string :name
      t.timestamps
    end

    create_table :department_types do |t|
      t.string :name
      t.timestamps
    end


    create_table :polyclinics do |t|
      t.references :hospital, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :academic_degree
      t.references :employee_category, foreign_key: true
      t.timestamps
    end

    create_table :patient_cards do |t|
      t.references :clinic, polymorphic: true
      t.string :diagnosis
      t.references :employee, foreign_key: true
      t.references :patient, foreign_key: true
      t.datetime :begin
      t.datetime :end
      t.timestamps
    end

    create_table :analyzes do |t|
      t.references :laboratory, foreign_key: true
      t.references :patient, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :contracts do |t|
      t.references :clinic, polymorphic: true
      t.references :laboratory, foreign_key: true
      t.text :description
      t.timestamps
    end

    create_table :polyclinic_staffs do |t|
      t.references :polyclinic, foreign_key: true
      t.references :employee, foreign_key: true
      t.timestamps
    end
    create_table :hospital_staffs do |t|
      t.references :hospital, foreign_key: true
      t.references :employee, foreign_key: true
      t.timestamps
    end


    create_table :blocks do |t|
      t.references :hospital, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :departments do |t|
      t.references :block, foreign_key: true
      t.references :department_type, foreign_key: true
      t.timestamps
    end

    create_table :wards do |t|
      t.string :name
      t.references :department, foreign_key: true
      t.timestamps
    end

    create_table :beds do |t|
      t.integer :bed_number
      t.references :ward, foreign_key: true
      t.references :patient, foreign_key: true
      t.timestamps
    end

  end
end
