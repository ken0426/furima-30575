class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
     @order_form = ItemForm.new
    end
  end

  def create
    @order_form = ItemForm.new(order_params)
     if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
     else
      render :index
     end
  end

  private
  def order_params
    params.require(:item_form).permit(
      :token, 
      :postalcode, 
      :area_id, 
      :municipality, 
      :address, 
      :building, 
      :phone, 
    )
    .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
