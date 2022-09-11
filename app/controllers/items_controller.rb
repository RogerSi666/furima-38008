class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy, :edit]

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

  def destory
    item.destroy
  end

  def edit
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :image, :information, :category_id, :quality_id, :prefecture_id, :shipment_day_id, :post_price_id, :price).merge(user_id: current_user.id)
  end
end
