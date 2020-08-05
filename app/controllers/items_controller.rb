class ItemsController < ApplicationController
  # 他のメンバーが作業中なのでトップページに飛ばされないようにコメントアウトしてます。
  # before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
    @parents = Category.where(ancestry: nil)    
  end
  def new
    @item = Item.new
    @item.images.build

  end
  
  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end     
  end   

  def show
    @item = Item.includes(:images).order('created_at DESC').find(params[:id])
  end


  def confirm
  
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :brand, :condition, :pref_id, :preparation_day, :category_id, :postage_burden, images_attributes: [:url])
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
