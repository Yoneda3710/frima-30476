class ItemsController < ApplicationController

  def index
    
  end

  def new
    @item = Item.new
  end
   
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :status_id, :shipping_id, :prefecture_id, :scheduled_id,).merge(user_id: current_user.id)
  end
  
end
