class ApplicationController < ActionController::Base
  # 全てのコントローラに適用
  before_action :require_login

  private

  # ログインしていない場合、ログイン画面へ遷移するよう指定
  def not_authenticated
    redirect_to login_path
  end
end
