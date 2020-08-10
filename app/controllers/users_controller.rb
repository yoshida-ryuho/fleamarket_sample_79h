class UsersController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_credit, only: [:buy,:confirm]
  before_action :set_item, only: [:buy,:confirm]
  


  def index
    @parents = Category.where(ancestry: nil) 
    @items = Item.includes(:images).order('created_at DESC').limit(5)
    @credit_information = Credit.where(user_id: current_user.id)
  end


  def edit

  end

  def confirm
    @image = @item.images.first
    @credit = @set_credit.first
    @destination = Destination.find(current_user.id)
    if @credit.blank?
      redirect_to controller: "credits", action: "new"
      flash[:alert] = 'クレジットカードを登録してください'
    else
    
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  def buy
    @credit = @set_credit.first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price,
    customer: @credit.customer_id,
    currency: 'jpy',
  )
  redirect_to action: 'done_buy', id: @item
  end

  def done_buy
    @buy_item = Item.find(params[:id])
    if @buy_item.update(buyer_id: current_user.id)
    redirect_to root_path
    flash[:alert] = '購入が完了しました' 
    else
    redirect_to confirm_user_path
    flash[:alert] = '購入に失敗しました'
    end
  end

  private

  def set_credit
    @set_credit = Credit.where(user_id: current_user.id)
  end

  def set_item
    @item = @item = Item.find(params[:id])
  end
end
