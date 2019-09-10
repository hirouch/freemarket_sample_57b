class ItemsController < ApplicationController

  def index
    # @items = Item.all.order(id: "DESC").limit(10)
    @womenitems = Item.where(category_id: 20..85).order(id: "DESC").limit(10)
    @menitems = Item.where(category_id: 91..144).order(id: "DESC").limit(10)
    @electricalitems = Item.where(category_id: 408..435).order(id: "DESC").limit(10)
    @toyitems = Item.where(category_id: 306..371).order(id: "DESC").limit(10)
    @chanelitems = Item.where(brand: "Chanel").order(id: "DESC").limit(10)
    @louisvuittonitems = Item.where(brand: "Louisvuitton").order(id: "DESC").limit(10)
    @supremeitems = Item.where(brand: "Supreme").order(id: "DESC").limit(10)
    @nikeitems = Item.where(brand: "Nike").order(id: "DESC").limit(10)
  end

  def new
    # if user_signed_in?
      # @item = Item.new
      # 5.times{@item.images.build}
    # else
    #   redirect_to new_user_session_path
    # end
    @item = Item.new
    @parents = Category.where(ancestry: nil) #Category.where(ancestry = ?, "nil")
    # @item.item_images.build
  end

  def create
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
