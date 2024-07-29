class PostsController < ApplicationController

  def new
    @post = Post.new
    @children = current_user.children
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to login_path, success: "作品を投稿しました"
    else
      flash.now[:warning] = "投稿に失敗しました"
      @children = current_user.children #作成に失敗しても、再びお子さまの情報を取得
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:child_id, :title, :image, :image_cache, :created_date, :explanation)
  end
end