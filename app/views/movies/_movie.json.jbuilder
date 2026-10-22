json.extract! movie, :id, :title, :director, :genre, :release_year, :rating, :synopsis, :created_at, :updated_at
json.url movie_url(movie, format: :json)
