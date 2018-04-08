# == Schema Information
#
# Table name: laboratories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Laboratory < ApplicationRecord
  has_many :analyzes, dependent: :destroy
  has_many :contracts, dependent: :destroy
end
