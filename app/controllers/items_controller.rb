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
