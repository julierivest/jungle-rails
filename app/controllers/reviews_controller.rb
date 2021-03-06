class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    product = Product.find(params[:product_id])
    review = product.reviews.create(review_params)

    review.user = current_user
    if review.save
      #;flash[:notice] = 'Review was successfully created.'
      redirect_to product
    else
      #flash[:notice] = "Error creating review: #{@review.errors}"
      redirect_to product
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    review = product.reviews.find(params[:id])
    review.destroy
    redirect_to product

  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
