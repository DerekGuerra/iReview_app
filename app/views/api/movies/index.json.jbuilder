json.array! @movies["results"].each do |movie|
  # json.movies movie
  json.id movie["id"]
  json.title movie["title"]
  json.release_date movie["release_date"]
  json.rating_count movie["vote_count"]
  json.rating_average movie["vote_average"]
  json.popularity movie["popularity"]
  # json.poster 'https://image.tmdb.org/t/p/w1280' + movie["poster_path"]
  if movie["poster_path"] == nil
    json.poster 'No poster for this movie'
  elsif json.poster 'https://image.tmdb.org/t/p/w1280' + movie["poster_path"]
  end
  json.summary movie["overview"]
end