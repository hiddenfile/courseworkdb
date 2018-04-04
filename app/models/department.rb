class Department < ApplicationRecord
  belongs_to :block
  belongs_to :department_type
end
