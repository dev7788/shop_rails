class RenameDepartmentalizesToDepartmentalization < ActiveRecord::Migration
  def change
    rename_table :deparmentalizes, :departmentalizations
  end
end
