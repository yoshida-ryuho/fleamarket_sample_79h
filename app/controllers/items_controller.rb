class ItemsController < ApplicationController
  # 他のメンバーが作業中なのでトップページに飛ばされないようにコメントアウトしてます。
  # before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
  end

  def new

  end

  def show
    item = Item.find(params[:id])
  end


  def confirm
  
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to profiles_path(current_user.id)
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
