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
#  begin              :datetime
#  end                :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  operations_success :integer
#  operations_fails   :integer
#

class PatientCard < ApplicationRecord
  belongs_to :clinic, polymorphic: true
  belongs_to :hospital, foreign_key: :clinic_id, foreign_type: 'Hospital'
  belongs_to :polyclinic, foreign_key: :clinic_id, foreign_type: 'Polyclinic'
  belongs_to :employee
  belongs_to :patient
end
