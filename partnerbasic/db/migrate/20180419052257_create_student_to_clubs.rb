class CreateStudentToClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :student_to_clubs do |t|
      t.references :club, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_admin

      t.timestamps
    end
  end
end
