if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'], 
    domain: 'https://powerful-escarpment-83407.herokuapp.com/',
    authentication: :plain,
    enable_starttls_auto: true
  }  
end