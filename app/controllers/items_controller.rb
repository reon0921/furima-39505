class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Successfully created.'
    else
      flash.now[:error] = @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :availability_id, :expected_shipping_date_id, :prefecture_id, :text)
  end
end 