class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def create
    @products = Products.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @products.errors.full_message }, status: 422
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    @product.save
    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Products Sucessfully Destroyed!" }, status: 422
  end
end
