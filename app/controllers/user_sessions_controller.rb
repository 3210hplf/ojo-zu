class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      if @user.profile
        redirect_to posts_path, success: "ログインが完了しました！"
      else
        redirect_to new_profile_path, success: "ログインが完了しました！さっそくプロフィールを設定しましょう！"
      end
    else
      flash.now[:warning] = "メールアドレスまたはパスワードが無効です"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
