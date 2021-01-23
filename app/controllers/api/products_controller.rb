class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    render "show.json.jb"
  end

  def create
    render "show.json.jb"
  end

  def update
    render "show.json.jb"
  end

  def destroy
    render json: { message: "Products Sucessfully Destroyed!" }
  end
end
