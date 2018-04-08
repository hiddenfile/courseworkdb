# == Schema Information
#
# Table name: employee_categories
#
#  id              :integer          not null, primary key
#  type            :string
#  level           :integer
#  salary_incrase  :integer
#  vacation        :integer
#  danger          :integer
#  operation_count :integer
#  operation_fails :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class EmployeeCategory < ApplicationRecord
end
