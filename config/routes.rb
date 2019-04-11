Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    #show all movies and search for movie
    get '/movies' => 'movies#index'
    get '/movies/search/:query' => 'movies#search'
    #show movie details
    get 'movies/:movie_id' => 'movies#show'
  end
end
