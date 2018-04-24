class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_hash
      t.string :photo_link
      t.text :description
      t.boolean :is_student

      t.timestamps
    end
  end
end
