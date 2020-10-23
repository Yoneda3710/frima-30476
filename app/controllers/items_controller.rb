class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,           only: [:show, :destroy, :edit]
  def index
    @items = Item.all.order(created_at: "DESC")
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

  def edit
    unless current_user.id == @item.user_id
     redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path#item_path(params[:id])
    else
      render :edit
    end
  end

  def show
    
  end
  
  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :status_id, :shipping_id, :prefecture_id, :scheduled_id,).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  
end
