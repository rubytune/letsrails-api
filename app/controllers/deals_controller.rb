class DealsController < ApplicationController
  def index
    city = City.find(params[:city_id])
    render :json => city.deals.running_now.includes(:deal_images, :options, :city => :country).to_json(:include => [:deal_images, :options])
  end

  def show
    render :json => Deal.includes(:deal_images, :options, :city => :country).find(params[:id]).to_json(:include => [:deal_images, :options])
  end
end
