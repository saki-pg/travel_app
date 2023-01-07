class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      # t.string :room_image
      # t.string :room_name
      # t.text :room_introduction
      # t.integer :price

      t.timestamps
    end
  end
end
