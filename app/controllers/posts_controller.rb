class PostsController < ApplicationController
  before_action :set_children, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:child)
  end

  def show
    @child = @post.child            # 作品の作者となるお子さまを取得
    @profile = @child.user.profile # お子さまを持つユーザープロフィールを取得
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @not_footer = true
  end

  def new
    @post = Post.new
  end

  def create
    Post.transaction do
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, success: "作品を投稿しました"
      else
        flash.now[:warning] = "投稿に失敗しました"
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    # 作品を取得し、作品はログイン中ユーザーが編集可能なものかを判定
    unless PostPolicy.new(current_user, @post).can_edit_or_delete?
      redirect_to post_path(@post), warning: "編集の権限がありません"
    end
  end

  def update
    if PostPolicy.new(current_user, @post).can_edit_or_delete?
      if @post.update(post_params)
        redirect_to post_path(params[:id]), success: "作品を編集しました"
      else
        flash.now[:warning] = "編集に失敗しました"
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to post_path(@post), warning: "更新の権限がありません"
    end
  end

  def destroy
    if PostPolicy.new(current_user, @post).can_edit_or_delete?
      @post.destroy!
      redirect_to posts_path,  success: "作品を削除しました"
    else
      redirect_to post_path(@post), warning: "削除の権限がありません"
    end
  end

  private

  def post_params
    params.require(:post).permit(:child_id, :title, :image, :image_cache, :created_date, :explanation)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_children
    @children = current_user.children
  end
end
