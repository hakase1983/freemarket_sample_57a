class CardsController < ApplicationController
  require "payjp"
  before_action :set_card
  def add
  end
  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    # card = Card.where(user_id: current_user.id).first
    # redirect_to action: "new" if card.present?
  end

 # indexアクションはここでは省略

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = 'sk_test_88d54ab32a6345343049552a'
   
    # if params['payjp-token'].blank?
    #   redirect_to action: "new"
    # else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
    customer = Payjp::Customer.create(
      description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
      card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。 # 無くてもOK。
    )
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to action: "new"
    else
      redirect_to action: "create"
    end
  end

  private

  def set_card
    # @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
