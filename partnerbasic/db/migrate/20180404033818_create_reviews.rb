class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :club, foreign_key: true
      t.references :company, foreign_key: true
      t.text :review_text

      t.timestamps
    end
  end
end
