class PlacesController < ApplicationController
  #before_action :set_place, only: [:show]

  def index
  end

  def search
  	session[:city] = BeermappingApi.places_in(params[:city])
    @places = BeermappingApi.places_in(params[:city])
  	if @places.empty?
  		redirect_to places_path, notice: "No locations in #{params[:city]}"
  	else
  		render :index
  	end
  end
end