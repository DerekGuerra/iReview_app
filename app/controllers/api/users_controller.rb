class Api::UsersController < ApplicationController
  def index
    @response = HTTP.get("https://api.themoviedb.org/3/account?")

    render json: @response.parse
  end
end
