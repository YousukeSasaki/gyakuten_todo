class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order('id desc').limit(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      # redirect_to 
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @category.valid?
      @category.update
      # redirect_to
    else
      render :new
    end
  end
  
  def destroy
    @category.delete
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit!
  end
end
