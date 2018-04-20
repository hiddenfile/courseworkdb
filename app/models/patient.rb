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

  # scope :by_hospital, -> (hospital){ joins(hospital_staffs: :hospital).where(hospitals: {name: hospital}) }
  # scope :by_polyclinic, -> (clinic){ joins(polyclinic_staffs: :polyclinic).where(polyclinics: {name: clinic}) }
  # class << self
  #   def ransackable_scopes(auth_object = nil)
  #     %w(by_hospital by_polyclinic)
  #   end
  # end
  #
  def name
    "#{first_name} #{last_name}"
  end


end
