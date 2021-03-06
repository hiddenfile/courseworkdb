# == Schema Information
#
# Table name: polyclinics
#
#  id          :integer          not null, primary key
#  hospital_id :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city        :string
#

class Polyclinic < ApplicationRecord
  belongs_to :hospital, required: false
  has_many :contracts, as: :clinic, dependent: :destroy
  has_many :patient_cards, as: :clinic, dependent: :destroy
end
