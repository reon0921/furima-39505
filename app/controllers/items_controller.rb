class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
      #:title, :catch_copy, :concept, :image
      #name
#|description price| |user|  category_id|  condition_id availability_id expected_shipping_date_id| integer  prefecture_id
    end