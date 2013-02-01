class CitiesController < ApplicationController
  def index
    country = Country.find(params[:country_id])
    render :json => country.cities.includes(:country).to_json(:include => [:country])
  end

  def show
    render :json => City.includes(:country).find(params[:id]).to_json(:include => [:country])
  end
end
