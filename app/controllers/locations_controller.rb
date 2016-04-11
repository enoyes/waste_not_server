class LocationsController < ApplicationController
  before_action :authenticate_with_token!

  def add_location
    location_name = params[:name]
    loc = Location.new(name: location_name)
    loc.group = @current_user.group
    if loc.save
      render json: {message: "Location added sucessfully", id: loc.id}, status: 200
    else
      render json: {message: "There was an error adding the location"}, status: 430
    end
  end


end
