class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.order(created_at: :desc).first
  end
end
