class AddUserColumnToExperiments < ActiveRecord::Migration[5.1]
  def change
  	add_column :experiments, :username, :string
  end
end
