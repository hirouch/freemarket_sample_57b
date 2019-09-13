class PurchasesController < ApplicationController

  require 'payjp'


  def index
  end

  def edit
    @item = Item.find(params[:id])
    @user = User.find(current_user)
    @address = Address.find(current_user)
    @card = CreditCard.find(current_user)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    @exp_month = @default_card_information.exp_month.to_s
    @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
  
  end

  def update
    @item = Item.find(params[:id])
    
    @card = CreditCard.find(current_user)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
  )

    @item.update(buyer_id: current_user.id)
    redirect_to controller: 'items', action: 'index'
  end
end
