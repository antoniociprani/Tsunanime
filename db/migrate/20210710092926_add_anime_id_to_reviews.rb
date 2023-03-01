class AddAnimeIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :anime_id, :integer
  end
end
