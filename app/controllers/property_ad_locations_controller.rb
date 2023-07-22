class PropertyAdLocationsController < ApplicationController
  def area_autocomplete_options
    input = params[:input]

    response = HTTParty.get("https://4ulq3vb3dogn4fatjw3uq7kqby0dweob.lambda-url.eu-central-1.on.aws/?input=#{input}")

    render json: response.parsed_response
  end
end
