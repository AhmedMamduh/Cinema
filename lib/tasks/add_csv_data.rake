require 'csv'

namespace :add_csv_data do
  task movies_data: :environment do
    CSV.foreach("movies.csv", headers: true) do |row|
      actor_id = Actor.find_by_name(row["Actor"])&.id
      country = Movie.countries[row["Country"].downcase]
      movie = Movie.find_or_create_by({ name: row["Movie"], description: row["Description"], year: row["Year"],
        director: row["Director"], filming_location: row["Filming location"],
        country: country})
      movie.movies_actors.find_or_create_by(actor_id: actor_id)
    end
  end

  task reviews_data: :environment do
    CSV.foreach("reviews.csv", headers: true) do |row|
      user_id = User.find_by_name(row["User"])&.id
      movie_id = Movie.where(name: row["Movie"]).last&.id
      review = Review.reviews[row["Review"].downcase.tr(" ", "_")]
      Review.find_or_create_by({ user_id: user_id, movie_id: movie_id, review: review, stars: row["Stars"]})
    end
  end
end