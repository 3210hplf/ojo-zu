class StampsController < ApplicationController
  def create
    @stamp = current_user.stamps.build(stamp_params)
    if @stamp.save
      @post = @stamp.post
      redirect_to @post, success: "スタンプを追加しました"
    else
      flash.now[:warning] = "スタンプの追加に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @stamp = current_user.stamps.find(params[:id])
    @post = @stamp.post
    current_user.unstamped(@stamp)
    redirect_to @post, success: "スタンプを削除しました"
  end

  private

  def stamp_params
    params.permit(:post_id, :stamp_type)
  end
end
