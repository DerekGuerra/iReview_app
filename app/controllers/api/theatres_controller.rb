class Api::TheatresController < ApplicationController

  def search

    city = params[:city]
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=movies+in+#{city}&key=#{ENV["THEATRE_API_KEY"]}")
    @theatres = response.parse

    render 'show.json.jbuilder'

  end
end

