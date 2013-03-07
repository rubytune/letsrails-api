class OptionsController < ApplicationController
  def show
    render :json => Option.find(params[:id])
  end
end
