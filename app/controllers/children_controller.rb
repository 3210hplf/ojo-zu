class ChildrenController < ApplicationController
  before_action :set_child, only: [:edit, :update]

  def new
    @child = Child.new
  end

  def create
    @child = current_user.children.build(child_params)
    if @child.save
      redirect_to login_path, success: "お子さまを登録しました"
    else
      flash.now[:warning] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to families_path, success: 'お子さま情報を編集しました'
    else
      flash.now[:warning] = '編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :birthday, :avatar_image, :avatar_image_cache)
  end

  def set_child
    @child = Child.find(params[:id])
  end
end
