class Api::MoviesController < ApplicationController

  def index 
    Tmdb::Api.key("#{ENV["API_KEY"]}")
    response = Tmdb::Discover.movie
    @movies = response
    
    render 'index.json.jbuilder'
  end

  def search
    Tmdb::Api.key("#{ENV["API_KEY"]}")
    response = Tmdb::Search.movie(params[:query])
    @movies = response

    render 'index.json.jbuilder'
  end

  def show
    Tmdb::Api.key("#{ENV["API_KEY"]}")
    movie_id = params[:movie_id]
    response = Tmdb::Movie.detail(movie_id)
    @movie = response

    render 'show.json.jbuilder'
  end

  def reviews
    movie_id = params[:movie_id]
    @response = Tmdb::Movie.reviews(movie_id)
    render json: @response
  end

  def create
    movie_id = params[:movie_id]
    rating = params[:value]
    @response = HTTP.post("https://api.themoviedb.org/3/movie/557/rating?api_key=#{ENV["API_KEY"]}&guest_session_id=0e1041dfef476fb7188e5555eb82c378",params:{value: rating})

    render json: @response.parse
  end


end
