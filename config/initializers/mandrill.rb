begin
  if Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      :address => "smtp.mandrillapp.com",
      :port => 587,
      :domain => 'mutuo.cc',
      :user_name => ::Configuration[:mandrill_username],
      :password => ::Configuration[:mandrill_api_key],
      :authentication => 'login',
      :domain => 'mutuo.cc',
      :enable_starttls_auto => true
    }
  end
rescue
  nil
end
