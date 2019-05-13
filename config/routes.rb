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
    #movies genres
    get '/movies/genres/' => 'movies#genres'
    #particular genre
    get '/movies/genres/:genre_id' => 'movies#genre_show'
    #show movie details
    get '/movies/:movie_id' => 'movies#show'
    #get movie reviews
    get '/movies/:movie_id/reviews' => 'movies#reviews'
    #make movie review 
    post '/movies' => 'movies#create'
    #show reviews
    get '/users/:id' => 'users#ShowReview'
    #delete review
    delete '/users/:id' => 'users#destroy'
    #Theatres
    get '/search_theatres/:city' => 'theatres#search'
    #Users
    get '/users' => 'users#index'
    #create User
    post '/users' => 'users#create'
    #sessions
    post '/sessions' => 'sessions#create'
    
  end
end

