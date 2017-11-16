class AddDemoAndCelDemoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :demo, :string
    add_column :users, :cel_demo, :string
  end
end
