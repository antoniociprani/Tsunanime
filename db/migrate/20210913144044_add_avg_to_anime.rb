class AddAvgToAnime < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :avg, :float
  end
end
