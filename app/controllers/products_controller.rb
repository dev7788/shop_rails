class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :edit, :destroy]

  def index
    # @products = Product.all
    @products = Product.order("price ASC").page(params[:page]).per(25)
  end

  def new
    @product = Product.new
  end

  def create
    # product_params = params.require(:product).permit([:name, :description, :price])
    # puts product_params
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Sounds like a real seller..."
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @review = Review.new
    # @product = Product.find(params[:id])
  end

  def edit
    # @product = Product.find(params[:id])
  end

  def update
    # @product = Product.find(params[:id])
    # product_params = params.require(:product).permit([:name, :description, :price])
    if @product.update(product_params)
      redirect_to(product_path(@product), flash: { success: "product updated" })
    else
      render :edit
    end
  end

  def destroy
    # product = Product.find(params[:id])
    @product.destroy
    redirect_to(root_path, flash: { danger: "product deleted" })
  end

  private

    def product_params
      params.require(:product).permit([:name, :description, :price])
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
