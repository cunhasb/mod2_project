class CreateLikeJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.integer :likee_id
    end

  end
end
