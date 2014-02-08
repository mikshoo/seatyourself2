class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :neighborhood
      t.string :cuisine
      t.string :availability

      t.timestamps
    end
  end
end
