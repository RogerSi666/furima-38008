class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:destroy, :edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  def edit
   @item.order.nil?
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect
    if current_user.id != @item.user.id
      redirect_to action: :index 
    end

  def item_params
    params.require(:item).permit(:title, :image, :information, :category_id, :quality_id, :prefecture_id, :shipment_day_id,
                                 :post_price_id, :price).merge(user_id: current_user.id)
  end
end
end
