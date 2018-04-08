# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  academic_degree      :string
#  employee_category_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Employee < ApplicationRecord
  belongs_to :employee_category
end
