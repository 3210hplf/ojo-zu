class ChildrenController < ApplicationController

  def new
    @child = Child.new
  end

  def create
    @child = current_user.children.build(child_params)
    if @child.save
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :birthday, :avatar_image, :avatar_image_cache)
  end
end
