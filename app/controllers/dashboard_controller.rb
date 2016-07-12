class DashboardController < ApplicationController

  def index
    render template: 'dashboard/index.html.erb'
  end

end
