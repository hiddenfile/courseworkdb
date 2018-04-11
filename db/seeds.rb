puts "Seeds"
puts "patient.rb"
100.times do
  Patient.create!(first_name: Forgery('name').first_name, last_name: Forgery('name').last_name)
end

puts "hospital.rb"
5.times do
  Hospital.create!(name: "#{Forgery('name').full_name}. Hospital", city: Forgery('address').city)
end

puts "polyclinic.rb"
5.times do
  Polyclinic.create!(name: "#{Forgery('name').full_name}. Clinic")
end
Hospital.pluck(:id).shuffle.each do |hospital_id|
  Polyclinic.create!(hospital_id: hospital_id, name: "#{Forgery('name').full_name}. Clinic")
end

puts "employee_category.rb"
%w(Allergist Geneticist Gynecologist Dermatologist Nutritionist ENT Mammologist Masseur
Neurologist Pediatrician Psychiatrist Dentist Therapist Urologist Surgeon Endocrinologist
Pediatrician Rheumatologist FamilyDoctor Pharmacologist).each do|kind|
  4.times do |level|
    EmployeeCategory.create!(kind: kind, level: level, salary_incrase: 10*level, vacation: 1*level, danger: 5*level)
  end
end

puts "employee.rb"
EmployeeCategory.all.each do |category|
  operation_fails = operation_count = 0
  if %w(Surgeon Dentist Gynecologist).include?(category.kind)
    operation_count = rand(100)
    operation_fails = rand(100)
  end
  Employee.create!(first_name: Forgery('name').first_name, last_name: Forgery('name').last_name,
                  employee_category: category, operation_fails: operation_fails, operation_count: operation_count)
end
categories = EmployeeCategory.all
20.times do
  category = categories.sample
  operation_fails = operation_count = 0
  if %w(Surgeon Dentist Gynecologist).include?(category.kind)
    operation_count = rand(100)
    operation_fails = rand(100)
  end
  Employee.create!(first_name: Forgery('name').first_name, last_name: Forgery('name').last_name,
                  employee_category: category, operation_fails: operation_fails, operation_count: operation_count)
end


puts "patient_card.rb"
diagnoses = ['avitaminosis', 'allergy', 'alcoholism', 'angioma', 'anury', 'arthrosis', 'arthritis', 'asthma', 'atherosclerosis',
 'basil disease', 'delirium tremens', 'wall-eye', 'botulism', 'bronchitis', 'bronchospasm', 'brucellosis',
 'stomach ulcer', 'smallpox', 'OX', 'sinusitis', 'hemorrhoids', 'hemochromatosis', 'hepatitis', 'pulmonary hypertension',
 'gonorrhea', 'flu', 'diabetes', 'dysentery', 'diphtheria', 'pneumonia', 'cold', 'eczema', 'encephalitis', 'stroke',
 'infarct', 'caries', 'colitis', 'measles', 'leukemia', 'malaria', 'marasmus', 'mastitis', 'mastopathy',
 'myocardial infarction', 'swelling of the lungs', 'addiction', 'ornithosis', 'otitis', 'poisoning', 'osteochondrosis',
 'pediculosis', 'poliomyelitis', 'tetanus', 'leprosy', 'radiation sickness', 'psoriasis', 'cancer', 'radiculitis', 'anthrax',
 'syphilis', 'Skumina\'s syndrome', 'sinusitis', 'rabies', 'AIDS', 'sarcoma', 'scoliosis', 'typhus (typhus)',
 'tuberculosis (dryness)', 'cholera', 'scurvy', 'schizophrenia']

count = 0
[Polyclinic, Hospital].each do |hospital|
  hospital.all.each do |clinic|
    Employee.all.each do |employee|
      Patient.all.each do |patient|
        diagnosis = diagnoses.sample
        break if count > 100000
        start_time = (5.year.ago + rand(1000).days)
        end_time = start_time + rand(1000).days
        PatientCard.create!(clinic: clinic, diagnosis: diagnosis, employee: employee, patient: patient,
                           begin: start_time,
                           end: end_time

        )
        count +=1
      end
    end
  end
end


puts "laboratory.rb"
10.times do
  Laboratory.create!(name: "#{Forgery('name').full_name}. Lab")
end

puts "analyze.rb"
Laboratory.all.each do |laboratory|
  Patient.all.each do |patient|
    Analyze.create!(name: "Analyze set N#{rand(10)+ 1}", laboratory: laboratory, patient: patient)
  end
end

puts "contract.rb"
Laboratory.all.each do |laboratory|
  [Polyclinic, Hospital].each do |hospital|
    hospital.all.each do |clinic|
      Contract.create!(clinic: clinic, laboratory: laboratory, description: Forgery('lorem_ipsum').text	)
    end
  end
end


puts "block.rb"
Hospital.all.each do |hospital|
  rand(10).times do |i|
    Block.create!(name: "Block N#{i+1}", hospital: hospital)
  end
end

puts "department_type.rb"
%w(Sanitary Therapeutic Surgical Gynecological Clinical Emergency Morgue).each do |name|
  DepartmentType.create!(name: name)
end

puts "department.rb"
Block.all.each do |block|
  (rand(2)+1).times do
    Department.create!(block: block, department_type: DepartmentType.all.sample)
  end
end

puts "ward.rb"
Department.all.each do |department|
  rand(5).times do |i|
    Ward.create!(department: department, name: "Ward N#{i+1}")
  end
end

puts "bed.rb"
Ward.all.each do |ward|
  rand(10).times do |i|
    Bed.create!(ward: ward, bed_number: i+1, patient: Patient.all.sample)
  end
end

puts "hospital_staff.rb"
Hospital.all.each do |hospital|
  Employee.all.each do |employee|
    if employee.id.even?
      HospitalStaff.create!(employee: employee, hospital: hospital)
    end
  end
end

puts "polyclinic_staff.rb"
PolyclinicStaff.all.each do |hospital|
  Employee.all.each do |employee|
    unless employee.id.even?
      PolyclinicStaff.create!(employee: employee, hospital: hospital)
    end
  end
end

