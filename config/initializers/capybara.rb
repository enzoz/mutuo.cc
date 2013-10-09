if Rails.env.development? || Rails.env.test?
  require 'capybara/rails'
  Capybara.default_driver = :webkit if Capybara.drivers.include? :webkit
end

