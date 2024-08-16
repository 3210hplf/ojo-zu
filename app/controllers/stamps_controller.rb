class StampsController < ApplicationController
  def create
    @stamp = current_user.stamps.create(stamp_params)
    redirect_to post_path(@stamp.post), success: 'スタンプを押しました'
  end

  def destroy
    @stamp = current_user.stamps.find(params[:id])
    current_user.unstamped(@stamp)
    redirect_to post_path(@stamp.post), success: 'スタンプを解除しました'
  end

  private

  def stamp_params
    params.permit(:post_id, :stamp_type)
  end
end
