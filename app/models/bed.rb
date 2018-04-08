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
  belongs_to :patient
end
