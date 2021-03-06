# Be sure to restart your server when you modify this file.

if Rails.env.production? && Configuration[:base_domain]
  Mutuo::Application.config.session_store :active_record_store, domain: Configuration[:base_domain]
else
  Mutuo::Application.config.session_store :active_record_store
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# Mutuo::Application.config.session_store :active_record_store

