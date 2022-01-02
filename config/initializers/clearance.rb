# frozen_string_literal: true

Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = 'noreply@booklub.app'
  config.rotate_csrf_on_sign_in = true
end
