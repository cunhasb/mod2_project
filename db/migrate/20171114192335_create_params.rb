class CreateParams < ActiveRecord::Migration[5.1]
  def change
    create_table :params do |t|
      t.string :project_name
      t.string :app_key

      t.timestamps
    end
  end
end
