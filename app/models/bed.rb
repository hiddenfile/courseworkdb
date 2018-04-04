class Bed < ApplicationRecord
  belongs_to :ward
  belongs_to :patient
end
