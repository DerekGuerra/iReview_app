class Api::MoviesController < ApplicationController
  # before_action :authenticate_user

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
    @reviews = Tmdb::Movie.reviews(movie_id)
    @movie = response
  render 'show.json.jbuilder'
  end

  def reviews
    movie_id = params[:movie_id]
    @response = Tmdb::Movie.reviews(movie_id)
    render json: @response
  end

  def create
    # current_user: current_user
    @review = Review.new(
      rating: params[:rating],
      movie_id: params[:movie_id],
      comment: params[:comment].to_s,
      user_id: current_user.id
     )

    if @review.save
      render json: {message: 'Review made'}
    else
      render json: {errors: @review.errors.full_messages}
    end
    # user_id = current_user
    # movie_id = params[:movie_id]
    # rating = params[:value]
    # @response = HTTP.post("https://api.themoviedb.org/3/movie/#{movie_id}/rating?api_key=#{ENV["API_KEY"]}&guest_session_id=0e1041dfef476fb7188e5555eb82c378",params:{value: rating})
    # comment =  params[:comment]

  end


end
