class StampsController < ApplicationController
  def create
    @stamp = current_user.stamps.create(stamp_params)
    @post = @stamp.post
  end

  def destroy
    @stamp = current_user.stamps.find(params[:id])
    @post = @stamp.post
    current_user.unstamped(@stamp)
  end

  private

  def stamp_params
    params.permit(:post_id, :stamp_type)
  end
end
