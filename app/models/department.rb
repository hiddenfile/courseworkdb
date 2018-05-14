# == Schema Information
#
# Table name: departments
#
#  id                 :integer          not null, primary key
#  block_id           :integer
#  department_type_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Department < ApplicationRecord
  belongs_to :block
  belongs_to :department_type
  has_many :wards, dependent: :destroy

  def name
    "Dep id:#{id}"
  end

end
