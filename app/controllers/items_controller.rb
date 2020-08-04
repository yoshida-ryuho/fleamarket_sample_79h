class ItemsController < ApplicationController
  # 他のメンバーが作業中なのでトップページに飛ばされないようにコメントアウトしてます。
  # before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
  end

  def new

  end

  def show
    @item = Item.includes(:images).order('created_at DESC').find(params[:id])
  end


  def confirm
  
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
