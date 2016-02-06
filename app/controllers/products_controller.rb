class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :edit, :destroy]

  def index
    # @products = Product.all
    @products = Product.order("price ASC")
  end

  def new
    @product = Product.new
  end

  def create
    # product_params = params.require(:product).permit([:name, :description, :price])
    # puts product_params
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "That's a really thoughtful updatae -- thanks"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    # @product = Product.find(params[:id])
  end

  def edit
    # @product = Product.find(params[:id])
  end

  def update
    # @product = Product.find(params[:id])
    product_params = params.require(:product).permit([:name, :description, :price])
    if @product.update(product_params)
      redirect_to product_path((@product), { notice: "product updated" })
    else
      render :edit
    end
  end

  def destroy
    # product = Product.find(params[:id])
    @product.destroy
    redirect_to(root_path, { notice: "product deleted" })
  end

  private

    def product_params
      params.require(:product).permit([:name, :description, :price])
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
