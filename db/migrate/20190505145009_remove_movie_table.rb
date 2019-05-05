class RemoveMovieTable < ActiveRecord::Migration[5.2]
  def change
    drop_table(Movie)
  end
end
