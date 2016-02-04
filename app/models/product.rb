class Product < ActiveRecord::Base

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_create :case_format

    private

      def case_format
        self.description = self.description.humanize
        self.name = self.name.titleize
      end
      
end
