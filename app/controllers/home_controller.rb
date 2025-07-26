class HomeController < ApplicationController
  def show
    @admin = Admin.find_by(id: session[:admin_id]) if session[:admin_id]
    @posts = Post.all.order(created_at: :desc)
  end
end
