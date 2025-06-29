class AdminController < ApplicationController
  def login
  end

  def login_post
    username = params[:username]
    password = params[:password]

    # ここで管理者認証を行う（例：Adminモデルがある場合）
    admin = Admin.find_by(username: username)


    if admin && admin.authenticate(password)
      session[:admin_id] = admin.id
      redirect_to home_show_path
    else
      render :login, status: :unprocessable_entity
    end
  end

  def logout
    session[:admin_id] = nil
    redirect_to home_show_path
  end

  def new
    @post = Post.new
    @admin = Admin.find_by(id: session[:admin_id])
  end


  def create
    @post = Post.new(params.require(:post).permit(:image1, :content1, :image2, :content2, :image3, :content3))
    if @post.save
      redirect_to post_path
    else
      redirect_to home_show_path
    end
  end

end
