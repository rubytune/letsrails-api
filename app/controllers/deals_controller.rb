class DealsController < ApplicationController
  def index
    if params[:city_id].present?
      @deals = City.find(params[:city_id]).deals
      @deals = @deals.select_type(params[:type]).running_now.includes(:deal_images, :options, :city => :country)
    elsif params[:id].present?
      @deals = Deal.includes(:deal_images, :options, :city => :country).find(params[:id])
    else
      @deals = Deal.includes(:deal_images, :options, :city => :country).all()
    end
    
    render :json => @deals.to_json(:include => [:deal_images, :options], :methods => :type)
  end

end

