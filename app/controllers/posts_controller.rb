class PostsController < ApplicationController
  before_action :set_post, only: [:show ,:edit, :update, :destroy]

  def index
    @post = Post.all.order(created_at: "DESC")
  end

  def def new
    @post = Post.new
  end
  
  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @post = Post.find(params[:id])
  end

  def edit
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice:"投稿を削除しました！"
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id #現在ログインしているuserのidを、postのuser_idカラムに挿入する
    # 戻るで処理を変更
    if params[:back]
      render :new
    else
      if @post.save
        #データが正しく入力されれば保存。
        redirect_to posts_path, 　notice: "投稿しました！"
      else
        #データにエラーが生じている場合。画面をそのまま返す。
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
    @post.user_id = current_user.id #現在ログインしているuserのidを、postのuser_idカラムに挿入する
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:id, :content, :image)
  end

  # idをキーとして値を取得するメソッドを追加
  def set_post
    @post = Post.find(params[:id])
  end

end
