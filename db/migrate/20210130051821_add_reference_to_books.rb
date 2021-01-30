class AddReferenceToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :author, null: false, foreign_key: true
  end
end
