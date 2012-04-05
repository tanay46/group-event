namespace :movies do
  desc "This task finds the top movies"
  task :gettop do
    puts "Starting to read csv.."
    require 'csv'
    movies = Hash.new
    CSV.open('movies.csv', 'r', ',') do |row|
      for col in row
        movie_a = col.split(/:/)
        if not movies[movie_a[1]]
          movies[movie_a[1]]=movie_a[0].to_i
        else
          movies[movie_a[1]] = movies[movie_a[1]] + movie_a[0].to_i
        end
      end
    end

    sorted_movies = movies.sort_by { |movie, score| -score }[0..2]
    puts "And the top 3 movies are..."
    sorted_movies.each do|movie,score|
      puts "#{movie}"
    end 
  end
end