# == Schema Information
#
# Table name: wards
#
#  id            :integer          not null, primary key
#  name          :string
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Ward < ApplicationRecord
  belongs_to :department
  has_many :beds, dependent: :destroy
  scope :full_empty, -> do
    ward_id = Bed.select('ward_id').where.not(patient_id: nil).group('ward_id').pluck(:ward_id)
    self.where.not(id: ward_id)
  end
end
