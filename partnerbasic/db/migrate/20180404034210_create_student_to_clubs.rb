class CreateStudentToClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :student_to_clubs do |t|
      t.references :student, foreign_key: true
      t.references :club, foreign_key: true
      t.boolean :is_admin

      t.timestamps
    end
  end
end
