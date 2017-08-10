class AddUserColumnToProcedures < ActiveRecord::Migration[5.1]
  def change
  	add_column :procedures, :username, :string
  end
end
