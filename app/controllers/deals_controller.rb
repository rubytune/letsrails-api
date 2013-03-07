class DealsController < ApplicationController
  def index
    if params[:id].present?
      detail
    else
      list
    end
  end

  protected
  def list
    render :json => City.find(params[:city_id]).deals.running_now.includes(:deal_images, :options, :city => :country).to_json(:include => [:deal_images, :options])
  end
  
  def detail
    render :json => Deal.includes(:deal_images, :options, :city => :country).find(params[:id]).to_json(:include => [:deal_images, :options])
  end
end
