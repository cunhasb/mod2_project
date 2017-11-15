class CreateProfileLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_labels do |t|
      t.integer :profile_id
      t.integer :label_id
    end
  end
end
