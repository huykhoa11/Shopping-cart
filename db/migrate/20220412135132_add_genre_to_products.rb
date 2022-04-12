class AddGenreToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :genre, :string
  end
end
