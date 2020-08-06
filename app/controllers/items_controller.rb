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

    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)

  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end

   # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
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
    @parents = Category.where(ancestry: nil)
  end


  def confirm
  
  end

  def destroy
    item = Item.find(params[:id])
      if item.seller_id == current_user.id
        item.destroy
      end
    # item_id = Item.find_by(params[:id])
    # item = Item(item_params_destroy)
    # item.destroy
    # item_id.destroy
    # redirect_to users_path(current_user)
  end

  def edit
    @item = Item.find_by(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :brand, :condition, :pref_id, :preparation_day, :category_id, :postage_burden, images_attributes: [:url]).merge(seller_id: current_user.id)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params_destroy
    params.require(:item).permit(:name, :introduction, :price, :brand, :condition, :pref_id, :preparation_day, :category_id, :postage_burden, images_attributes: [:url]).merge(seller_id: :buyer_id)
  end

end
