class AddPosterAndReviewToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :poster_url, :string
    add_column :movies, :review, :text
  end
end
