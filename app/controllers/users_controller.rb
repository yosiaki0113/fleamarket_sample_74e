class UsersController < ApplicationController
  before_action :set_likes_items

  def index
    @products = Product.all
    end
  
  def show
  
  end
  
  def destroy
  end

  def set_likes_items
    if user_signed_in?
      @like_items = Item.where(id: current_user.likes.select("item_id"))
    end
  end

end
