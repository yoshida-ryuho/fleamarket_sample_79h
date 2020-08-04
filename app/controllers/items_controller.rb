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
    # @item = Items.(item_params)
    # # @item = current_user.items.build(item_params)
    # @item.save
    Item.create(item_params)
    redirect_to root_path
  end   

  def show

  end


  def confirm
  
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :brand, :condition, :pref_id, :preparation_day, :category, :postage_burden, images_attributes: [:url])
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
