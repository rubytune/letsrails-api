class DealsController < ApplicationController
  def index
    if params[:city_id].present?
      @deals = City.find(params[:city_id]).deals.select_type(params[:type]).running_now.includes(:deal_images, :options, :city => :country).to_json(:include => [:deal_images, :options])
    elsif params[:id].present?
      @deals = Deal.includes(:deal_images, :options, :city => :country).find(params[:id]).to_json(:include => [:deal_images, :options])
    else
      @deals = Deal.includes(:deal_images, :options, :city => :country).all().to_json(:include => [:deal_images, :options])
    end
    
    render :json => @deals
  end

end
