class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.time :slot
      t.integer :restaurant_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
