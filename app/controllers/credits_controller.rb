class CreditsController < ApplicationController
  require "payjp"

  def new
    credit = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if credit.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to :users
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      customer.delete
      credit.delete
      redirect_to :users
      flash[:alert] = 'クレジットカードの情報を削除しました'
    end
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      @default_card_information = customer.cards.retrieve(credit.card_id)
    end
  end

  def edit
    credit = Credit.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      @default_card_information = customer.cards.retrieve(credit.card_id)
  
  end


  def update
    @credit = Credit.where(user_id: current_user.id)
    binding.pry

    if Credit.update(params[:id])
      redirect_to user_path
      flash[:notice]= 'クレジットカード情報を登録しました'
    else
      render :edit
    end
  end



end
