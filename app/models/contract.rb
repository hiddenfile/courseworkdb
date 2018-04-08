# == Schema Information
#
# Table name: contracts
#
#  id            :integer          not null, primary key
#  clinic_type   :string
#  clinic_id     :integer
#  laboratory_id :integer
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Contract < ApplicationRecord
  belongs_to :clinic, polymorphic: true
  belongs_to :laboratory
end
