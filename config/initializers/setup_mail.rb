if Rails.env.development? || Rails.env.production?
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'secure-meadow-2165.herokuapp.com' }
  ActionMailer::Base.smtp_settings = {
    :addresses            => 'smtp.sendgrid.net',
    :port                 => '2525',
    :authentication       => :plain,
    :user_name            => ENV['SENDGRID_USERNAME'],
    :password             => ENV['SENDGRID_PASSWORD'],
    :domain               => 'heroku.com',
    :enable_starttls_auto => true
  }
end