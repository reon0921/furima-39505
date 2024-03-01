class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # Saveが成功したときの処理（たとえば、リダイレクト）
      redirect_to @item, notice: 'Successfully created.'
    else
      flash.now[:error] = @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end
  

  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :user, :category_id, :condition_id, :availability_id, :expected_shipping_date_id, :prefecture_id, :text)
      #:title, :catch_copy, :concept, :image
      #name
#|description price| |user|  category_id|  condition_id availability_id expected_shipping_date_id| integer  prefecture_id
    end
end