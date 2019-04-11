class Api::MoviesController < ApplicationController

  def index 

    response = HTTP.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=falseSe_adult=false")

    @movies = response.parse
 
    render 'index.json.jbuilder'
  end

  def search

    search = params[:query]

    response = HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV["API_KEY"]}&language=en-US&query=#{search}&include_adult=false")
    
    @movies = response.parse

    render 'index.json.jbuilder'

  end

  def show

    movie_id = params[:movie_id]

    @response = HTTP.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=5ed1739fc1aeafad4e5aeb4bafef0568&language=en-US")

    render json: @response.parse

  end

end
