class Admin::CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to [:admin, :categories], notice: 'Category created!'
  end

  def index
    @categories = Category.order(:name).all
  end

  private

  def category_params
    params.require(:category).permit(
      :name
      )
  end

end
