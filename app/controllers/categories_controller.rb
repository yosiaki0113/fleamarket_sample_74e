class CategoriesController < ApplicationController
  before_action :set_category, only: :show
  before_action :set_likes_items, only: [:index, :show]
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
  def set_likes_items
    if user_signed_in?
      @like_items = Item.where(id: current_user.likes.select("item_id"))
    end
  end

end
