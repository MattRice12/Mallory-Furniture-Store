class ProductsController < ApplicationController
  def index
    render template: 'products/index.html.erb', locals: {
      products: Product.all,
      categories: Category.all
    }
  end

  def show
    if Product.exists?(params[:id])
      render template: 'products/show.html.erb', locals: {
        product: Product.find(params[:id]),
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      product: Product.new
    }
  end

  def create
    product = Product.new
    product.name = params[:name]
    product.price = params[:price]
    product.condition = params[:condition]
    product.on_clearance = params[:on_clearance]
    product.quantity = params[:quantity]
    product.prod_url = params[:prod_url]
    product.category_id = params[:category_id]
    if product.save
      redirect_to "/products/#{product.id}"
    else
      render template: "/products/new.html.erb", locals: {
        product: product
      }
    end
  end

  def edit
    render locals: {
      product: Product.find(params[:id])
    }
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name] if params[:name].present?
    product.name = params[:price] if params[:price].present?
    product.name = params[:quantity] if params[:quantity].present?
    product.name = params[:condition]
    product.name = params[:on_clearance]
    product.name = params[:prod_url] if params[:prod_url].present?
    product.category_id = params[:category_id]
    if product.save
      redirect_to "/products/#{product.id}"
    else
      render template: 'products/edit.html.erb', locals: {
        product: product
      }
    end
  end
end
