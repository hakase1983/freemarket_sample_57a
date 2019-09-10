class PurchaseController < ApplicationController
  require 'payjp'

  def index
    @personal_info = PersonalInfo.find(current_user.id)
    @item = Item.find(params[:item_id])
    card = Card.where(user_id: current_user.id).first
    
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAY_JP_SECRET"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    render layout: 'compact'
  end

  def pay
    @item = Item.find(params[:item_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAY_JP_SECRET']
    Payjp::Charge.create(
    amount: @item.price, 
    customer: card.customer_id, 
    currency: 'jpy', 
  )
  redirect_to  root_path 
  end
end
