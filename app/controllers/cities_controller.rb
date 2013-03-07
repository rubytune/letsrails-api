class CitiesController < ApplicationController  
  def index
    if params[:country_id].present?
      @cities = Country.find(params[:country_id]).cities.includes(:country).to_json(:include => [:country])
    elsif params[:id].present?
      @cities = City.includes(:country).find(params[:id]).to_json(:include => [:country])
    else
      @cities = City.includes(:country).all().to_json(:include => [:country])
    end
    
    render :json => @cities
  end
end
