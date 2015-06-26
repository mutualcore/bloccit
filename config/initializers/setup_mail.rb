if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['app37230053@heroku.com'],
    password:       ENV['m4uobdn84867'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end