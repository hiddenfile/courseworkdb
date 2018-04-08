# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Patient < ApplicationRecord
  has_many :analyzes, dependent: :destroy
  has_many :beds, dependent: :destroy
  has_many :patient_cards, dependent: :destroy
end
