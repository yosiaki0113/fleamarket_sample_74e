class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  
  def index
    @items = Item.includes(:images).order(created_at: "DESC") #新規登録順で表示
  end
  
  def show
    @seller = Item.find(params[:id]).seller
  end

  def show_itemlist
  end

  def new
    render layout: 'sub_header_footer'
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.roots
  end

  def category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      flash.now[:notice] = '出品には必須項目が必要です'
      render :new
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
    params.require(:item).permit(:name, :category_id, :price, :text,
     :condtion, :postage_type, :prefectures, :days_until_shipping, :brand,
      images_attributes: [:image, :_destroy, :id]).
      merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end