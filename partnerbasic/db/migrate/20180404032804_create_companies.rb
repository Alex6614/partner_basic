class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.text :description
      t.string :company_link
      t.string :photo_link

      t.timestamps
    end
  end
end
