class Departmentalization < ActiveRecord::Base
  belongs_to :department
  belongs_to :product

  validates :department_id, uniqueness: { scope: :product }

end
