# == Schema Information
#
# Table name: patient_cards
#
#  id          :integer          not null, primary key
#  clinic_type :string
#  clinic_id   :integer
#  diagnosis   :string
#  employee_id :integer
#  patient_id  :integer
#  begin       :datetime
#  end         :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PatientCard < ApplicationRecord
  belongs_to :clinic, polymorphic: true
  belongs_to :employee
  belongs_to :patient
end
