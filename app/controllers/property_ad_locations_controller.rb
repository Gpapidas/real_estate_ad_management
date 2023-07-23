class PropertyAdLocationsController < ApplicationController
  def area_autocomplete_options
    input = params[:input]
    encoded_input = URI.encode_www_form_component(input)
    begin
      cached_response = Rails.cache.read("area_autocomplete/#{input}")
      if cached_response
        render json: cached_response
      else
        response = HTTParty.get("https://4ulq3vb3dogn4fatjw3uq7kqby0dweob.lambda-url.eu-central-1.on.aws/?input=#{encoded_input}")

        Rails.cache.write("area_autocomplete/#{input}", response.parsed_response, expires_in: 1.day)

        render json: response.parsed_response
      end
    rescue HTTParty::Error, SocketError
      render json: { error: "Failed to fetch data. Please try again later." }, status: :service_unavailable
    rescue StandardError
      render json: { error: "An unexpected error occurred. Please try again later." }, status: :internal_server_error
    end
  end
end
