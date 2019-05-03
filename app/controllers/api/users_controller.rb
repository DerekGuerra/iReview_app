class Api::UsersController < ApplicationController
  def index
    @response = HTTP.get("https://api.themoviedb.org/3/account?api_key=#{ENV["API_KEY"]}&session_id=97e2e4b64a8a618712bdefd2d940ce8514efeeba")

    render json: @response.parse
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email], 
      password: params[:password], 
      password_confirmation: params[:password_confirmation]
      )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
