class AddColumnToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :balance, :string 
  end
end
