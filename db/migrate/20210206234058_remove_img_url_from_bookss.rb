class RemoveImgUrlFromBookss < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :img_url, :string
  end
end
