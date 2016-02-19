class Department < ActiveRecord::Base

  has_many :departmentalizations, dependent: :destroy
  has_many :products, through: :departmentalizations

  validates :name, presence: true

end
