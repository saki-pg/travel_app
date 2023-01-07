class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :passwords
      t.string :passwords_confirmation
      t.string :image
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
