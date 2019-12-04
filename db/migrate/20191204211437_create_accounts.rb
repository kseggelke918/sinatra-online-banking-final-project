class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.integer :user_id 
    end 
  end
end
