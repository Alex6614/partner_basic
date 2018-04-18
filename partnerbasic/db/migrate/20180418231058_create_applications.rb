class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.text :text
      t.timestamp :date_added
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
