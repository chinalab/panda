class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
