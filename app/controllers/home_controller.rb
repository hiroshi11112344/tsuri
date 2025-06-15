class HomeController < ApplicationController
  def show
    @admin = Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end
end
