class RemoveReferenceFromAuthors < ActiveRecord::Migration[6.0]
  def change
    remove_reference :authors, :book, null: false, foreign_key: true
  end
end
