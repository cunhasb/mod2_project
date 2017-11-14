class CreateProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :attribute_1
      t.string :attribute_2
      t.string :attribute_3
      t.string :attribute_4
      t.string :attribute_5
      t.string :attribute_6
      t.string :attribute_7
      t.string :attribute_8
      t.string :attribute_9
      t.string :attribute_10
      t.integer :user_id
    end
  end
end
