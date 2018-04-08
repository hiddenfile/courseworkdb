# == Schema Information
#
# Table name: beds
#
#  id         :integer          not null, primary key
#  bed_number :integer
#  ward_id    :integer
#  patient_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bed < ApplicationRecord
  belongs_to :ward
  belongs_to :patient
end


# Dir.foreach("#{Rails.root}/app/models") do |model_path|
#   model = (model_path.split('.')[0].classify rescue nil)
#   if model && model != 'ApplicationRecord' && model != 'Concern'
#     `rails generate active_admin:resource #{model}`
#   end
# end
