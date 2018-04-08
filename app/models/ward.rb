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
end
