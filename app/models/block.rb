# == Schema Information
#
# Table name: blocks
#
#  id          :integer          not null, primary key
#  hospital_id :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Block < ApplicationRecord
  belongs_to :hospital
  has_many :departments, dependent: :destroy
end
