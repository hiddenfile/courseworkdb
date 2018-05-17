# == Schema Information
#
# Table name: wards
#
#  id            :integer          not null, primary key
#  name          :string
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  kind          :string
#  employee_id   :integer
#

class Ward < ApplicationRecord
  belongs_to :department
  belongs_to :employee

  has_many :beds, dependent: :destroy

  KIND = %w(full day consulting)

  scope :for_patients, -> {where(kind: %w{full day})}
  scope :for_employee, -> {where(kind: %w{consulting})}
  scope :full_empty, -> do
    ward_id = Bed.select('ward_id').where.not(patient_id: nil).group('ward_id').pluck(:ward_id)
    self.where.not(id: ward_id)
  end
end
