class OrderController < ApplicationController
  require 'payjp'
  before_action :set_likes_items
  def index
    @item = Item.find(params[:item_id])
    @image = Image.where(item_id: @item).first
    @category = Category.find(@item.category_id)
    @user = current_user
    @address = current_user.shipping_addresses[0]
    # binding.pry
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    render layout: 'sub_header_footer'
  end

  def pay
    @item = Item.find(params[:item_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => 'jpy', 
  )
    @item.update(purchase_date: Time.current)
    @item.update(trading_status: "取引中")
    @item.update(buyer_id: current_user.id)

  redirect_to action: 'done' 
  end

  def set_likes_items
    if user_signed_in?
      @like_items = Item.where(id: current_user.likes.select("item_id"))
    end
  end
end
