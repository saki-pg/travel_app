class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id

      t.string :room_name
      t.text :room_introduction
      t.integer :price

      t.text :address
      t.string :room_image
      t.text :person

      belongs_to :user
      t.timestamps
    end
  end
end

