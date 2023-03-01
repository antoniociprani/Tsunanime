class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :descripton
      t.date :release_date
      t.string :author

      t.timestamps
    end
  end
end
