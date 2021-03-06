json.movie_id @movie["id"]
json.title @movie["original_title"]
json.poster 'https://image.tmdb.org/t/p/w1280' + @movie["poster_path"]
json.tagline @movie["tagline"]
json.movie_homepage @movie["homepage"]
json.summary @movie["overview"]
json.release_date @movie["release_date"]
json.runtime @movie["runtime"]
json.status @movie["status"]
json.vote_count @movie["vote_count"]
json.vote_average @movie["vote_average"]
json.popularity @movie["popularity"]
json.revenue @movie["revenue"]
json.reviews @reviews["results"].each do |result|
  json.author result["author"]
  json.content result["content"]
end
json.genres @movie["genres"].each do |genre|
  json.genre genre.name
end