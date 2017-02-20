class ReviewsController < ApplicationController

  # before_filter :authorize, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.build(review_params)
    @review.product = @product

    if @review.save
      redirect_to product_path(@product), notice: 'Your review has been posted.'
    else
      redirect_to :back, notice: 'Your review must contain a rating.'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id]), notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end



end
