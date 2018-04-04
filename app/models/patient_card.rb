class PatientCard < ApplicationRecord
  belongs_to :clinic, polymorphic: true
  belongs_to :employee
  belongs_to :patient
end
