class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    @item.images.new

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
  

end
