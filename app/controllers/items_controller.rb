class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:destroy, :edit]

  def index
    @items = Item.includes(:user).all.order('created_at DESC')
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def search
    if params[:q]&.dig(:title)
      squished_keywords = params[:q][:title].squish
      params[:q][:title_cont_any] = squished_keywords.split(" ")
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect
    if current_user.id != @item.user.id
      redirect_to action: :index 
    else
    end
  end

  def item_params
    params.require(:item).permit(:title, :image, :information, :category_id, :quality_id, :prefecture_id, :shipment_day_id,
                                 :post_price_id, :price).merge(user_id: current_user.id)
  end
end
