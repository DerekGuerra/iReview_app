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
    get '/search_movies/:query' => 'movies#search'
    #show movie details
    get '/movies/:movie_id' => 'movies#show'
    #get movie reviews
    get '/movies/:movie_id/reviews' => 'movies#reviews'
    #make movie review 
    post '/movies' => 'movies#create' 

    #Theatres
    get '/search_theatres/:city' => 'theatres#search'

    #Users
    get '/users' => 'users#index'
    #create User
    post '/users' => 'users#create'
    
  end
end

