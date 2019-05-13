json.array! @genres.each do |genre|
  json.genre_id genre["id"]
  json.name genre["name"]
end