#patient.rb
Patient.destroy_all
100.times do
  Patient.create(first_name: Forgery('name').first_name, last_name: Forgery('name').last_name)
end

#hospital.rb
Hospital.destroy_all
100.times do
  Hospital.create(name: "#{Forgery('name').full_name}. Hospital", city: Forgery('address').city)
end

#polyclinic.rb
Polyclinic.destroy_all
50.times do
  Polyclinic.create(name: "#{Forgery('name').full_name}. Hospital", city: Forgery('address').city)
end
Hospital.pluck(:id).shuffle.each do |hospital_id|
  Polyclinic.create(hospital_id: hospital_id, name: "#{Forgery('name').full_name}. Clinic")
end

# employee_category.rb
EmployeeCategory.create
#employee.rb
# Employee.create(first_name: Forgery('name').first_name, last_name: Forgery('name').last_name)


# patient_card.rb
# analyze.rb
# bed.rb
# block.rb
# contract.rb
# department.rb
# department_type.rb
# employee.rb
# hospital_staff.rb
# laboratory.rb
# polyclinic.rb
# polyclinic_staff.rb
# ward.rb