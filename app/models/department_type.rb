# == Schema Information
#
# Table name: department_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DepartmentType < ApplicationRecord
  has_many :departments, dependent: :destroy
end
