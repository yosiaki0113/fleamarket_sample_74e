class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @parents = Category.roots
  end


  def show
    @parents = Category.roots
    @items = @category.set_items
    @items = @items.order("created_at DESC")
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

end
