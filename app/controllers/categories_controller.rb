class CategoriesController < ApplicationController

  def index
      @category_children = Category.find(params[:parent_id]).children
      respond_to do |format|
        format.html
        format.json
      end
  end
    
 
  def new

  end

  def show
    @parents = Category.where(ancestry: nil) 
    @parent_name = Category.find(params[:id])
  end

  def get_category_children

    @category_children = Category.where(ancestry: params[:id])
    # binding.pry
    respond_to do |format|
      format.html
      format.json
    end
  end

  def get_category_grandchildren
  
    @category_grandchildren = Category.find(params[:child_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end


end
