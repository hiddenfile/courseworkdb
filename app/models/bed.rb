# == Schema Information
#
# Table name: beds
#
#  id         :integer          not null, primary key
#  bed_number :integer
#  ward_id    :integer
#  patient_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bed < ApplicationRecord
  belongs_to :ward
  belongs_to :patient, required: false
  has_one :department, through: :ward
  has_one :block, through: :department
  has_one :hospital, through: :block


  scope :by_patient, -> (id){ where( patient_id: (id == 'none' ? nil : id))}


  class << self
    def ransackable_scopes(auth_object = nil)
      %w(by_patient)
    end
  end

end
