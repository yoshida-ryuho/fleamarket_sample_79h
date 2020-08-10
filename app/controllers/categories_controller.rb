class CategoriesController < ApplicationController

  def index

  end
    
 
  def new

  end

  def show
      @parents = Category.where(ancestry: nil) #親のレコード全部
      @parent = Category.find(params[:id]) #クリックしたカテゴリーのレコード１つ
      @children_records = @parent.children #クリックしたカテゴリの子レコード全部
      @parent_record = @parent.parent #クリックしたカテゴリの親レコード

      
    if @children_records.empty? #孫カテゴリが選択されたら 
        @items = Item.where(category_id: params[:id]).order('created_at DESC')
        @images = @items.includes(:images) #該当カテゴリのitemにimagesがくっついてる
      
     elsif @parent_record == nil  #親カテゴリが選択されたら
        grandchildrenIds = @parent.indirect_ids #indirect_idsメソッドで該当カテゴリの孫のID(これがitemsテーブルのcategory_idに入る)を取得
        
        @items = Item.where(category_id: grandchildrenIds).order('created_at DESC') # 該当カテゴリのitemたち
        @images = @items.includes(:images) #該当カテゴリのitemにimagesがくっついてる

     else #子カテゴリが選択されたら
        category = Category.find(params[:id])
        grandchildrenIds = category.child_ids
        @items = Item.where(category_id: grandchildrenIds).order('created_at DESC')
        @images = @items.includes(:images) #該当カテゴリのitemにimagesがくっついてる
      
    end  
  end
end