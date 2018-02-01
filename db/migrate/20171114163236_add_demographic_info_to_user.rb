class AddDemographicInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age_appearance, :string
    add_column :users, :gender_appearance, :string
    add_column :users, :multicultural_appearance, :string
  end
end
