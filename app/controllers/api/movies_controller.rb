class Api::MoviesController < ApplicationController

  def index 

    search = params[:search]

    response = HTTP.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1")
    @movies = response.parse

    render 'index.json.jbuilder'
  end

  
end
