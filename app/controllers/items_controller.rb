class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
    @items = Item.all.select{ |item| item.image.attached? }
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Successfully created.'
    else
      flash.now[:error] = @item.errors.full_messages
      puts @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  private


  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :availability_id, :expected_shipping_date_id, :prefecture_id, :text, :image).merge(user_id: current_user.id)
  end
end 