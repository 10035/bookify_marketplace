class AddImgUrlToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :img_url, :string
  end
end
