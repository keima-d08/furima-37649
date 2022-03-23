class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buyer_destination = BuyerDestination.new
    if @item.buyer.present?
       redirect_to root_path
    elsif
      @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
      @buyer_destination = BuyerDestination.new(buyer_params)
    if @buyer_destination.valid?
       @buyer_destination.save
       redirect_to root_path
    else
      render :index
    end
  end

  

  private

  def buyer_params
    params.require(:buyer_destination).permit(:postcode, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id,  item_id: params[:item_id])
  end

end