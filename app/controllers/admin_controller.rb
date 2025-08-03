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
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to home_show_path
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :postsKey,
      :image1, :content1,
      :image2, :content2,
      :image3, :content3,
      :image4, :content4,
      :image5, :content5,
      :image6, :content6,
      :image7, :content7,
      :image8, :content8,
      :image9, :content9,
      :image10, :content10
    )
  end

end
