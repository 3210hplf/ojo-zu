class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    # プロフィールはログインしているユーザーに関連づけられている
    @profile = current_user.build_profile(profile_params)
    # チケットの枚数は登録時0枚
    @profile.ticket_count = 0
    if @profile.save
      redirect_to new_child_path, success: 'プロフィールを登録しました'
    else
      flash.now[:warning] = CREATE_FAILED
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to families_path, success: 'プロフィールを編集しました'
    else
      flash.now[:warning] = UPDATE_FAILED
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar, :avatar_cache, :name, :relationship)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
