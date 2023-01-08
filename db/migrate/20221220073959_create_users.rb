class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :passwords
      t.string :passwords_confirmation
      t.string :image
      t.text :introduction


      has_many :posts
      has_many :resavations
      t.timestamps
    end
  end
end
