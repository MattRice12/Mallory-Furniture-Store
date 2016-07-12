class ProductsController < ApplicationController
  def index
    render template: 'products/index.html.erb', locals: {
      products: Product.all,
      product1: Product.find(1),
      product2: Product.find(2)
    }
  end

  def show
    if Product.exists?(params[:id])
      render template: 'products/show.html.erb', locals: {
        product: Product.find(params[:id])
      }
    else
      render html: "Not Found", status: 404
    end
  end

end
