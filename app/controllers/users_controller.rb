class UsersController < ApplicationController
  def index
    @products = Product.all
    end
  
  def show
  
  end
  
  def destroy
  end

end
