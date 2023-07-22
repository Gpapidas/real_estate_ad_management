class PropertyAdLocationsController < ApplicationController
  def area_autocomplete_options
    input = params[:input]

    cached_response = Rails.cache.read("area_autocomplete/#{input}")
    if cached_response
      render json: cached_response
    else
      response = HTTParty.get("https://4ulq3vb3dogn4fatjw3uq7kqby0dweob.lambda-url.eu-central-1.on.aws/?input=#{input}")

      Rails.cache.write("area_autocomplete/#{input}", response.parsed_response, expires_in: 1.day)

      render json: response.parsed_response
    end
  end
end
