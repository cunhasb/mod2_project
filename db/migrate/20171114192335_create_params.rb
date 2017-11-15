class CreateParams < ActiveRecord::Migration[5.1]
  def change
    # drop_table :params
    create_table :params do |t|
      t.string :project_name
      t.string :app_key

      t.timestamps
    end
  end
end
