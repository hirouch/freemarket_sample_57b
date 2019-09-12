class PurchasesController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @user = User.find(current_user)
    @address = Address.find(current_user)
  end

  def update
    @item = Item.find(params[:id])
    @item.update(buyer_id: current_user.id)
    redirect_to controller: 'items', action: 'index'
  end
end
