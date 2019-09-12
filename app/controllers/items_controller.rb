class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :destroy, :my_item, :buy_confirm]
  # before_action :authenticate_user!, only: [:new]

  def index
    # @items = Item.all.order(id: "DESC").limit(10)
    @womenitems = Item.where(category_id: 20..85).order(id: "DESC").limit(10)
    @menitems = Item.where(category_id: 91..144).order(id: "DESC").limit(10)
    @electricalitems = Item.where(category_id: 408..435).order(id: "DESC").limit(10)
    @toyitems = Item.where(category_id: 306..371).order(id: "DESC").limit(10)
    @chanelitems = Item.where(brand: "シャネル").order(id: "DESC").limit(10)
    @louisvuittonitems = Item.where(brand: "ルイヴィトン").order(id: "DESC").limit(10)
    @supremeitems = Item.where(brand: "シュプリーム").order(id: "DESC").limit(10)
    @nikeitems = Item.where(brand: "ナイキ").order(id: "DESC").limit(10)
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
    @item.item_images.build
    
  end

  def create
    @item = Item.new(item_params)
    @parents = Category.where(ancestry: nil)
    @item.save
    if @item.save && new_image_params[:images][0] != ""
      new_image_params[:images].each do |image|
        @item.item_images.create(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      @item.item_images.build
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])
    @selleritems = Item.where(seller_id: @item.seller_id).order(id: "DESC").limit(6)
    @branditems = Item.where(brand: @item.brand).order(id: "DESC").limit(6)
    @user = User.find(@item.seller_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def select
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @children = Category.find(params[:parent_id]).children
        else
          @grand_children = Category.find(params[:child_id]).children
        end
      end
    end
  end

  def select_grand
    respond_to do |format|
      format.html
      format.json { @grand_children_info = Category.find(params[:grand_id]) }
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status, :delivery_cost, :delivery_way, :prefecture_id, :delivery_date, :price).merge(seller_id: current_user.id)
  end

  def new_image_params
    # binding.pry
    params.require(:new_images).permit({images: []})
  end

  private 
  def set_item
    @item = Item.find(params[:id])
  end
end
