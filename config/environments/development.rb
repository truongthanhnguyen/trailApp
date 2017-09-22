Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true

  # config.action_mailer.delivery_method = :test
  # host = "localhost:3000" 
  # config.action_mailer.default_url_options = {host: host}

  config.action_mailer.delivery_method = :smtp
  host = "localhost:3000"
  config.action_mailer.default_url_options = {host: host}
  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.sendgrid.net",
    :port           => "587",
    :authentication => :plain,
    :user_name      => "rei6bluemix",
    :password       => "truongthanh10",
    :domain         => "heroku.com",
    :enable_starttls_auto => true
  }


  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

end
