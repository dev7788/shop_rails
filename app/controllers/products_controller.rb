class ProductsController < ApplicationController

  def index
    # @products = Product.all
    @products = Product.order("price ASC")
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit([:name, :description, :price])
    puts product_params
    @product = Product.new(product_params)
    if @product.save
      render text: "SUCCESS!"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    product_params = params.require[:product].permit([:name, :description, :price])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

end
