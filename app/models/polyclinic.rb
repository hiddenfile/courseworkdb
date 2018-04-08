# == Schema Information
#
# Table name: polyclinics
#
#  id          :integer          not null, primary key
#  hospital_id :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Polyclinic < ApplicationRecord
  belongs_to :hospital
end
