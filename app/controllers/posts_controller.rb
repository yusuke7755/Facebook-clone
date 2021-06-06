class PostsController < ApplicationController
  before_action :set_post, only: [:show ,:edit, :update, :destroy ]

  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end
  
  def show
    @post = set_post
  end

  def edit
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice:"投稿を削除しました！"
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def update
    if params[:back]
      render :edit
    elsif @post.update(post_params)
      redirect_to posts_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:id, :content, :image ,:image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
