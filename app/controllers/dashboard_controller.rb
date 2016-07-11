class DashboardController < ApplicationController

  def index
    render template: 'products/root.html.erb'
  end
  
end
