class ApplicationController < ActionController::Base
  # 共通部分のフラッシュメッセージを定数として定義
  CREATE_FAILED = "登録に失敗しました".freeze
  UPDATE_FAILED = "編集に失敗しました".freeze

  # 全てのコントローラに適用
  before_action :require_login

  # フラッシュメッセージのタイプを追加
  add_flash_types :success, :danger, :warning, :info

  private

  # ログインしていない場合、ログイン画面へ遷移するよう指定
  def not_authenticated
    redirect_to login_path
  end
end
