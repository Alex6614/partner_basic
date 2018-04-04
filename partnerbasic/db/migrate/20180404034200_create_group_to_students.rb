class CreateGroupToStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_to_students do |t|
      t.references :group, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
