class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_items, only: [:index, :show_itemlist, :show, :edit, :update]
  before_action :set_items_c, only: [:show, :edit, :update]
  before_action :check_user_signin, only: [:new] 

  
  def index
  end
  
  def show
    @seller = Item.find(params[:id]).seller
    @user = current_user
    @items_f = Item.all.includes(:user)
  end

  def destroy
    @item.destroy 
    redirect_to root_path
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.roots
    render layout: 'sub_header_footer'
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    if @item.brand.blank?
      @item.brand = nil
    end
    if @item.save
      
      redirect_to root_path, notice: '商品を出品しました'
    else
      @item.images.new
      flash.now[:notice] = '出品には必須項目が必要です'
      render :new,layout: 'sub_header_footer'
    end
  end

  def card_new
  end

  def card_add
  end

  def card_done
  end

  def show_itemlist
  end

  def purchase
    render layout: 'sub_header_footer'
  end

  def done
    render layout: 'sub_header_footer'
  end

  def my_page_logout
  end

  def my_page
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :text, :brand,
     :condtion_id, :postage_type_id, :prefecture_id, :days_until_shipping_id,
      images_attributes: [:url, :_destroy, :id]).
      merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_items
    @items = Item.includes(:images).order(created_at: "DESC").limit(5) #新規登録順で表示
    @items_all = Item.includes(:images).order(created_at: "DESC")#新規登録順で表示
  end

  def set_items_c
    @items_c = @item.category.parent.parent.set_items
    @items_c = @items_c.where.not(id: @item.id)
    @items_c = @items_c.where(buyer_id: nil).order("created_at DESC")

  end

  def check_user_signin
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

end