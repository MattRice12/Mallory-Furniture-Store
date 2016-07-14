class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def disable_nav
    @disable_nav = true
  end

end
