class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
  end

  def new

  end

  def show

  end


  def confirm
  
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
