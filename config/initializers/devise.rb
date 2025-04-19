# frozen_string_literal: true

Devise.setup do |config|
  # ==> Mailer Configuration
  config.mailer_sender = "please-change-me@example.com"

  # If you want to use a custom mailer, uncomment the line below:
  # config.mailer = 'Devise::Mailer'

  # Load and configure the ORM. Supports :active_record (default) and :mongoid (others require plugins).
  require "devise/orm/active_record"

  # ==> Configuration for any authentication mechanism
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]

  # If true, Devise will attempt to find a matching route using the scope.
  # config.paranoid = true

  # ==> Navigation configuration
  config.skip_session_storage = [ :http_auth ]

  # ==> Security extension
  config.stretches = Rails.env.test? ? 1 : 12

  # ==> Confirmable
  # config.reconfirmable = true

  # ==> Expire all remember me tokens on sign out
  config.expire_all_remember_me_on_sign_out = true

  # ==> Password Length
  config.password_length = 6..128

  # ==> Email Regex
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Time interval you can reset your password with a reset password key
  config.reset_password_within = 6.hours

  # ==> Sign out method
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add your OmniAuth providers here if using them
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Devise JWT (if used)
  # config.jwt do |jwt|
  #   jwt.secret = Rails.application.credentials.devise_jwt_secret_key!
  #   jwt.dispatch_requests = [
  #     ['POST', %r{^/login$}]
  #   ]
  #   jwt.revocation_requests = [
  #     ['DELETE', %r{^/logout$}]
  #   ]
  # end
end
