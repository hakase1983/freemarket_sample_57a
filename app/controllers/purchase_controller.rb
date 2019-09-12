class PurchaseController < ApplicationController
  require 'payjp'

  def index
    if PersonalInfo.where(user_id: current_user.id).blank?
      redirect_to new_personal_info_path and return
      
    else
      @personal_info = PersonalInfo.find(current_user.id)
      @item = Item.find(params[:item_id])
      card = Card.where(user_id: current_user.id).first
      
    end
    
    if card.blank?
      redirect_to controller: "cards", action: "new" and return
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
