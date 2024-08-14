class StampsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @stamp = current_user.stamps.new(stamp_type: 'Good', post_id: params[:post_id])
    if @stamp.save
      redirect_to post_path(@post), success: 'スタンプを押しました'
    else
      redirect_to posts_path
    end
  end

  def destroy
    @post = current_user.stamps.find(params[:id]).post
    current_user.stamp_posts.destroy(@post)
    redirect_to post_path(@post), success: 'スタンプを解除しました'
  end
end
