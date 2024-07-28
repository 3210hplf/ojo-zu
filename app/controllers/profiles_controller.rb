class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    # プロフィールはログインしているユーザーに関連づけられている
    @profile = current_user.build_profile(profile_params)
    # チケットの枚数は登録時0枚
    @profile.ticket_count = 0
    if @profile.save
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:avatar, :avatar_cache, :name, :relationship)
  end
end
