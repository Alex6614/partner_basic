class CreateClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.string :university_name
      t.string :club_link
      t.text :description
      t.string :photo_link
      t.boolean :verified

      t.timestamps
    end
  end
end
