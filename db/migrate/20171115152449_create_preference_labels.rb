class CreatePreferenceLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :preference_labels do |t|
      t.integer :preference_id
      t.integer :label_id
      t.timestamps
    end
  end
end
