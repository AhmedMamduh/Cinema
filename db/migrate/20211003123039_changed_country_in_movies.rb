class ChangedCountryInMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :country
    add_column :movies, :country, :integer
  end
end
