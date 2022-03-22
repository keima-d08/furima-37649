class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @buy = Destination.new(destination_params)
    if @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

end
