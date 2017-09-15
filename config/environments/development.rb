# Rails.application.configure do

#   config.cache_classes = false
#   config.eager_load = false
#   config.consider_all_requests_local = true

#   if Rails.root.join('tmp/caching-dev.txt').exist?
#     config.action_controller.perform_caching = true

#     config.cache_store = :memory_store
#     config.public_file_server.headers = {
#       'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
#     }
#   else
#     config.action_controller.perform_caching = false

#     config.cache_store = :null_store
#   end

#   # Don't care if the mailer can't send.
#   config.action_mailer.raise_delivery_errors = true
#   config.action_mailer.delivery_method = :test
#   host = "localhost:3000"
#   config.action_mailer.default_url_options = {host: host}


#   config.action_mailer.perform_caching = true


#   config.active_support.deprecation = :log
#   config.active_record.migration_error = :page_load
#   config.assets.debug = true
#   config.assets.quiet = true
#   config.file_watcher = ActiveSupport::EventedFileUpdateChecker
# end

Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :test
  host = "localhost:3000" 
  config.action_mailer.default_url_options = {host: host}

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

end