class CategoriesController < ApplicationController
  def index
    @children = Category.find(params[:parent_id]).children
  end
end
