class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]
  before_action :redirect_if_own_product, only: [:index]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @donation_address = DonationAddress.new
  end

  def create
    Rails.logger.debug(purchase_params.inspect)
    @donation_address = DonationAddress.new(purchase_params)
    if @donation_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                   # 通貨の種類（日本円）
      )
      @donation_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:donation_address).permit(:prefecture_id,  :post_code,:municipalities,:street_address,:telephone_number,:building_name).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def redirect_if_own_product
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
