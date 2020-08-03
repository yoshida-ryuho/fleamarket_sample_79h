class ItemsController < ApplicationController
  def index

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

end
