class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  DEFAULT_ROLE = "poster".freeze

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = DEFAULT_ROLE
    if @user.save
      redirect_to login_path, success: "ユーザー登録に成功しました"
    else
      flash.now[:warning] = CREATE_FAILED
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
