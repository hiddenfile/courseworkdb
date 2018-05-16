# == Schema Information
#
# Table name: hospital_staffs
#
#  id          :integer          not null, primary key
#  hospital_id :integer
#  employee_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hired_at    :date
#  fired_at    :date
#

class HospitalStaff < ApplicationRecord
  belongs_to :hospital
  belongs_to :employee
end
