class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      belongs_to :user
      t.timestamps
    end
  end
end
