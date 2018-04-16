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

  scope :by_hospital, -> (hospital){ joins(hospital_staffs: :hospital).where(hospitals: {name: hospital}) }
  scope :by_polyclinic, -> (clinic){ joins(polyclinic_staffs: :polyclinic).where(polyclinics: {name: clinic}) }
  scope :by_doctor_category, -> (specialty){ doctors.where(specialty: specialty) }
  scope :by_support_category, -> (specialty){ support.where(specialty: specialty) }
  scope :by_city, -> (city){
    joins(%Q{LEFT JOIN "polyclinic_staffs" ON "polyclinic_staffs"."employee_id" = "employees"."id" LEFT JOIN "polyclinics" ON "polyclinics"."id" = "polyclinic_staffs"."polyclinic_id"}).
        joins(%Q{INNER JOIN "hospital_staffs" ON "hospital_staffs"."employee_id" = "employees"."id" LEFT JOIN "hospitals" ON "hospitals"."id" = "hospital_staffs"."hospital_id"}).
        where("polyclinics.city = :city or hospitals.city = :city", city: city).
        group('employees.id')
  }
  class << self
    def ransackable_scopes(auth_object = nil)
      %w(by_hospital by_polyclinic by_doctor_category by_support_category by_city)
    end
  end

end
