# == Schema Information
#
# Table name: patient_cards
#
#  id                 :integer          not null, primary key
#  clinic_type        :string
#  clinic_id          :integer
#  diagnosis          :string
#  employee_id        :integer
#  patient_id         :integer
#  start_at           :datetime
#  end_at             :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  operations_success :integer
#  operations_fails   :integer
#

class PatientCard < ApplicationRecord
  belongs_to :clinic, polymorphic: true
  belongs_to :hospital, foreign_key: :clinic_id, foreign_type: 'Hospital', required: false
  belongs_to :polyclinic, foreign_key: :clinic_id, foreign_type: 'Polyclinic', required: false
  belongs_to :patient
  belongs_to :employee
end
