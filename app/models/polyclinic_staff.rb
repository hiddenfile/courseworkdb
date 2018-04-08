# == Schema Information
#
# Table name: polyclinic_staffs
#
#  id            :integer          not null, primary key
#  polyclinic_id :integer
#  employee_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PolyclinicStaff < ApplicationRecord
  belongs_to :polyclinic
  belongs_to :employee
end
