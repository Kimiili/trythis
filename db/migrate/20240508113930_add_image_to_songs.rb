class AddImageToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :image, :string
  end
end
