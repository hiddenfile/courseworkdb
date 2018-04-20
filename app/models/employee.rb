# == Schema Information
#
# Table name: employees
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  academic_degree :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  specialty       :string
#  level           :integer
#

class Employee < ApplicationRecord
  SUPPORT = %w(nurse cleaner handyman rest accountant)
  SPECIALITY = %w(Allergist Geneticist Gynecologist Dermatologist Nutritionist ENT Mammologist Masseur
                    Neurologist Pediatrician Psychiatrist Dentist Therapist Urologist Surgeon Endocrinologist
                    Pediatrician Rheumatologist FamilyDoctor Pharmacologist)

  has_many :hospital_staffs, dependent: :destroy
  has_many :polyclinic_staffs, dependent: :destroy
  has_many :patient_cards, dependent: :destroy
  scope :support, -> {where(specialty: SUPPORT)}
  scope :doctors, -> {where(specialty: SPECIALITY)}

  scope :by_hospital, -> (hospital){ select('employees.*, hospitals.name as additional').joins(hospital_staffs: :hospital).where(hospitals: {name: hospital}) }
  scope :by_polyclinic, -> (clinic){ select('employees.*, polyclinics.name as additional').joins(polyclinic_staffs: :polyclinic).where(polyclinics: {name: clinic}) }
  scope :by_doctor_category, -> (specialty){ where(specialty: specialty) }
  scope :by_support_category, -> (specialty){ where(specialty: specialty) }
  scope :by_city, -> (city){
    select("employees.*, '#{city.gsub(/\W/, '')} as additional").
    joins(%Q{LEFT JOIN "polyclinic_staffs" ON "polyclinic_staffs"."employee_id" = "employees"."id" LEFT JOIN "polyclinics" ON "polyclinics"."id" = "polyclinic_staffs"."polyclinic_id"}).
        joins(%Q{INNER JOIN "hospital_staffs" ON "hospital_staffs"."employee_id" = "employees"."id" LEFT JOIN "hospitals" ON "hospitals"."id" = "hospital_staffs"."hospital_id"}).
        where("polyclinics.city = :city or hospitals.city = :city", city: city).
        group('employees.id')
  }

  scope :operations, -> (count, symb){
    select('employees.*, (sum(patient_cards.operations_fails) + sum(patient_cards.operations_success)) as additional').
        joins(:patient_cards).having("(sum(patient_cards.operations_fails) + sum(patient_cards.operations_success)) #{symb} :count", count: count).group('id')
  }
  scope :operations_equals, -> (count){operations(count, '=')}
  scope :operations_greater_than, -> (count){operations(count, '>')}
  scope :operations_less_than, -> (count){operations(count, '<')}

  scope :by_experience, -> (years){
    select('employees.*, (sum(patient_cards.operations_fails) + sum(patient_cards.operations_success)) as additional').
    joins(%Q{LEFT JOIN "polyclinic_staffs" ON "polyclinic_staffs"."employee_id" = "employees"."id"}).
        joins(%Q{INNER JOIN "hospital_staffs" ON "hospital_staffs"."employee_id" = "employees"."id"}).
        where("(:year_now - date_part('year', hospital_staffs.hired_at)) > :years or (:year_now - date_part('year', polyclinic_staffs.hired_at)) = :years", years: years.to_i, year_now: Date.today.year).
        group('employees.id')
  }
  class << self
    def ransackable_scopes(auth_object = nil)
      %w(by_hospital by_polyclinic by_doctor_category by_support_category by_city operations_equals operations_greater_than operations_less_than by_experience)
    end
  end

  def name
    "#{first_name} #{last_name}"
  end


end
