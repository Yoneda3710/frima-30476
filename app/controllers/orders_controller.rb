class OrdersController < ApplicationController

  def index
   @order = Item.find(params[:item_id])
  end
  
  def create
    Order.create(order_params)
    Address.create(address_params)
    redirect_to action::index
  end

  private
  def order_params
    params.permit.merge(user_id: user.id, item_id: item.id)
  end

  def address_params
    params.premit(:postal_code, :prefectures_id, :municipality, :address, :building, :phone_number).merge(order_id: order.id)
  end



end
