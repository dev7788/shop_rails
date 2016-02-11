class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id]) #found through routes params
    @review = Review.new(review_params) # just instanstiated
    @review = @product.reviews.new(review_params)
    # @review.product_id = @product.id #this sets the foreign_key on the review to be associated with the product
    # @review = Product.find(params[:product_id]).review.new(review_params)
    if @review.save
      redirect_to product_path(@product), notice: "Review created successfully"
    else
      # can just render the template associated here...but how does it find the id? we already have the id
      render "products/show"
      # render json: params
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # we can redirect back to the product path because our resources are in the URL and are accessible.
    redirect_to product_path(params[:product_id]), notice: "Answer destroyed."
  end

    private

      def review_params
        params.require(:review).permit([:body])
      end
end