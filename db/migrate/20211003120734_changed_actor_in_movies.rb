class ChangedActorInMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :actor
  end
end
