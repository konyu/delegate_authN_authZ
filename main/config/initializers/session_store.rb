# デフォルトだとapp名_sessionになる
Rails.application.config.session_store :cookie_store, key: '_local_session', domain: '.dev.local'