# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  academic_degree      :string
#  employee_category_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  operation_count      :integer
#  operation_fails      :integer
#

class Employee < ApplicationRecord
  belongs_to :employee_category
  has_many :hospital_staffs, dependent: :destroy
  has_many :polyclinic_staffs, dependent: :destroy
  has_many :patient_cards, dependent: :destroy
  scope :by_hospital, -> (hospital){ joins(hospital_staffs: :hospital).where(hospitals: {name: hospital}) }
  scope :by_polyclinic, -> (clinic){ joins(polyclinic_staffs: :polyclinic).where(polyclinics: {name: clinic}) }
  scope :by_category, -> (kind){ joins(:employee_category).where(employee_categories: {kind: kind}) }



  class << self
    def ransackable_scopes(auth_object = nil)
      %w(by_hospital by_polyclinic by_category)
    end
  end

end
