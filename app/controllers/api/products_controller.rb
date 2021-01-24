class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:discount] == "true"
      @products = @products.where("price < ?", 250)
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = products.order(price: :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = products.order(price: :desc)
    else
      @products = @products.order(id: :asc)
    end

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
