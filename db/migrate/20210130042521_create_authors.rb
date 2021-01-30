class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :genre
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
