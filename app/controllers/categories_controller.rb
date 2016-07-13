class CategoriesController < ApplicationController
  def index
    render template: 'categories/index.html.erb', locals: {
      categories: Category.all,
      products: Product.all
    }
  end

  def show
    if Category.exists?(params[:id])
      render template: 'categories/show.html.erb', locals: {
        category: Category.find(params[:id]),
        products: Product.all
      }
    else
      render html: "Not Found", status: 404
    end
  end

end
