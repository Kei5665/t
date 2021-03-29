require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Insta
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.generators do |g|
      g.skip_routes true #ルーティングを追加しない
      g.assets false #アセットファイルを生成しない
      g.test_framework false #テストを生成しない
    end
    config.time_zone = 'Tokyo' #タイムゾーンを設定
    
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    
    module App
      class Application < Rails::Application
        config.generators.template_engine = :slim #slimに変更
      end                                                                                                                                                                     
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
