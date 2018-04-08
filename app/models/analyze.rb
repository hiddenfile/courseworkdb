# == Schema Information
#
# Table name: analyzes
#
#  id            :integer          not null, primary key
#  laboratory_id :integer
#  patient_id    :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Analyze < ApplicationRecord
  belongs_to :laboratory
  belongs_to :patient
end
