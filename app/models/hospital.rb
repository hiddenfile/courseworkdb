# == Schema Information
#
# Table name: hospitals
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hospital < ApplicationRecord
  has_many :blocks, dependent: :destroy
  has_many :contracts, as: :clinic, dependent: :destroy
  has_many :patient_cards, as: :clinic, dependent: :destroy
  has_one :polyclinic, dependent: :destroy
  has_many :hospital_staffs, dependent: :destroy
end
