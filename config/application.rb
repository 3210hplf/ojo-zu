require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    # generater時に余計なファイルが生成されないよう設定
    config.generators do |g|
      g.skip_routes true   # ルーティングの記述を作成しない
      g.helper false       # helper ファイルを作成しない
      g.test_framework nil # test ファイルを作成しない
    end

    # デフォルトの言語を日本語に設定
    config.i18n.default_locale = :ja
  end
end
