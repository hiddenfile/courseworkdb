class Contract < ApplicationRecord
  belongs_to :clinic, polymorphic: true
  belongs_to :laboratory
end
