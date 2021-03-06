class BlogsController < ApplicationController

  before_action :redirect_non_login_user, only: %i[show new edit]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:blog][:image].present?
      @blog.image.retrieve_from_cache! params[:blog][:image]
    end
    if @blog.save
      BlogMailer.create_mail(@blog).deliver
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログを編集しました！'
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private

  def blog_params
    params.require(:blog).permit(:user_id, :title, :content, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
