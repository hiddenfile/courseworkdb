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
  Polyclinic.create!(name: "#{Forgery('name').full_name}. Clinic", city: Forgery('address').city)
end
Hospital.all.each do |hospital|
  Polyclinic.create!(hospital: hospital, name: "#{Forgery('name').full_name}. Clinic", city: hospital.city)
end

puts "employee.rb"
academic = %w(candidate doctor associate professor)
50.times do |i|
  Employee.create!(email: "user#{i}@example.com",password: 'abcdef', password_confirmation: 'abcdef',
                   first_name: Forgery('name').first_name, last_name: Forgery('name').last_name,
                   specialty: Employee::SPECIALITY.sample, level: rand(3) + 1, academic_degree: (academic + Array.new(4)).sample)
end
50.times do |i|
  Employee.create!(email: "user#{50 + i}@example.com",password: 'abcdef', password_confirmation: 'abcdef',
                   first_name: Forgery('name').first_name, last_name: Forgery('name').last_name,
                   specialty: Employee::SUPPORT.sample)
end

puts "hospital_staff.rb"
Employee.all.each do |employee|
  if employee.id.even?
    hospital = Hospital.all.sample
    start_time = (6.year.ago + rand(1000).days)
    HospitalStaff.create!(employee: employee, hospital: hospital, hired_at: start_time)
  end
end


puts "polyclinic_staff.rb"
Employee.all.each do |employee|
  unless employee.id.even?
    polyclinic = Polyclinic.all.sample
    start_time = (6.year.ago + rand(1000).days)
    PolyclinicStaff.create!(employee: employee, polyclinic: polyclinic, hired_at: start_time)
  end
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

(PolyclinicStaff.all + HospitalStaff.all).each do |staff|
  clinic = staff.is_a?(HospitalStaff) ? staff.hospital : staff.polyclinic
  next if Employee::SUPPORT.include?(staff.employee.specialty)
  Patient.all.each do |patient|
    diagnosis = diagnoses.sample
    start_time = (5.year.ago + rand(1000).days)
    end_time = start_time + rand(1000).days

    operations_success = operations_fails = 0
    if %w(Surgeon Dentist Gynecologist).include?(staff.employee.specialty)
      operations_success = rand(3)
      operations_fails = rand(3)
    end

    PatientCard.create!(clinic: clinic, diagnosis: diagnosis, employee: staff.employee, patient: patient,
                        start_at: start_time,
                        end_at: end_time,
                        operations_success: operations_success,
                        operations_fails: operations_fails
    )
  end
end

puts "laboratory.rb"
10.times do
  Laboratory.create!(name: "#{Forgery('name').full_name}. Lab")
end

puts "analyze.rb"
Laboratory.all.each do |laboratory|
  Patient.all.each do |patient|
    Analyze.create!(name: "Analyze set N#{rand(10) + 1}", laboratory: laboratory, patient: patient)
  end
end

puts "contract.rb"
Laboratory.all.each do |laboratory|
  [Polyclinic, Hospital].each do |hospital|
    hospital.all.each do |clinic|
      Contract.create!(clinic: clinic, laboratory: laboratory, description: Forgery('lorem_ipsum').text)
    end
  end
end


puts "block.rb"
Hospital.all.each do |hospital|
  rand(10).times do |i|
    Block.create!(name: "Block N#{i + 1}", hospital: hospital)
  end
end

puts "department_type.rb"
%w(Sanitary Therapeutic Surgical Gynecological Clinical Emergency Morgue).each do |name|
  DepartmentType.create!(name: name)
end

puts "department.rb"
Block.all.each do |block|
  (rand(2) + 1).times do
    Department.create!(block: block, department_type: DepartmentType.all.sample)
  end
end

puts "ward.rb"
Department.all.each do |department|
  rand(5).times do |i|
    Ward.create!(department: department, name: "Ward N#{i + 1}", employee: Employee.doctors.all.sample, kind: Ward::KIND.sample)
  end
end

puts "bed.rb"
Ward.for_patients.all.each do |ward|
  rand  = rand(10)
  rand.times do |i|
    Bed.create!(ward: ward, bed_number: i + 1, patient: Patient.all.sample)
  end
  rand.times do |i|
    Bed.create!(ward: ward, bed_number: rand + i + 1)
  end
end

