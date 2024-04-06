class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_item, only: [:edit, :update]
  before_action :restrict_edit, only: [:edit, :update]


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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def restrict_edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :availability_id, :expected_shipping_date_id, :prefecture_id, :text, :image, :expected_shipping_date_id).merge(user_id: current_user.id)
  end
end