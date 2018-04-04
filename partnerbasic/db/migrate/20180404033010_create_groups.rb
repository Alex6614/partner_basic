class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :club, foreign_key: true
      t.string :group_name

      t.timestamps
    end
  end
end
