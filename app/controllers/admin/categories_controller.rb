class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

   Rails.configuration.stripe = {
    2:   :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    3:   :secret_key      => ENV['STRIPE_SECRET_KEY']
    4  }



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
