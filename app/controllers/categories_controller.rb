class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all.order('id asc')
  end
  
  def edit; end
  
  def update
    @category.assign_attributes(category_params)
    if @category.valid?
      @category.save
      flash[:notice] = "カテゴリーを更新しました"
      redirect_to categories_path
    else
      flash.now[:alert] = "カテゴリーの更新に失敗しました"
      render :edit
    end
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
