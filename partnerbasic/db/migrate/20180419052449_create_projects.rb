class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :project_name
      t.text :description
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
