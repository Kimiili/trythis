class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :genre
      t.string :singer
      t.text :about
      t.string :movie

      t.timestamps
    end
  end
end
