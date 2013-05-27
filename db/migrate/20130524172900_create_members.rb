class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.string :favorite_food
      t.boolean :accepted_eua

      t.timestamps
    end
  end
end
