# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'Porto Alegre', en: 'Porto Alegre' },
  { pt: 'Rio de Janeiro', en: 'Rio de Janeiro' },
  { pt: 'São Paulo', en: 'São Paulo' },
  { pt: 'Floripa', en: 'Floripa' }
].each do |name|
   category = Category.find_or_initialize_by_name_pt name[:pt]
   category.update_attributes({
     name_en: name[:en]
   })
 end

[
  'confirm_backer','payment_slip','project_success','backer_project_successful',
  'backer_project_unsuccessful','project_received', 'project_received_channel', 'updates','project_unsuccessful',
  'project_visible','processing_payment','new_draft_project', 'new_draft_channel', 'project_rejected',
  'pending_backer_project_unsuccessful', 'project_owner_backer_confirmed', 'adm_project_deadline',
  'project_in_wainting_funds', 'credits_warning', 'backer_confirmed_after_project_was_closed',
  'backer_canceled_after_confirmed', 'new_user_registration'
].each do |name|
  NotificationType.find_or_create_by_name name
end

{
  company_name: 'Mútuo',
  host: 'mutuo.cc',
  base_url: "http://mutuo.cc",
  blog_url: "http://blog.mutuo.cc",
  email_contact: 'contato@mutuo.cc',
  email_payments: 'financeiro@mutuo.cc',
  email_projects: 'projetos@mutuo.cc',
  email_system: 'system@mutuo.cc',
  email_no_reply: 'no-reply@mutuo.cc',
  facebook_url: "http://facebook.com/mutuo.cc",
  facebook_app_id: '1405409603010977',
  twitter_username: "mutuo_cc",
  mailchimp_url: "http://catarse.us5.list-manage.com/subscribe/post?u=ebfcd0d16dbb0001a0bea3639&amp;id=149c39709e",
  catarse_fee: '0.15',
  support_forum: 'http://suporte.mutuo.cc/',
  base_domain: 'mutuo.cc',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key',
  project_finish_time: '02:59:59'
}.each do |name, value|
   conf = Configuration.find_or_initialize_by_name name
   conf.update_attributes({
     value: value
   })
end


Channel.find_or_create_by_name!(
  name: "Channel name",
  permalink: "sample-permalink",
  description: "Lorem Ipsum"
)


OauthProvider.find_or_create_by_name!(
  name: 'facebook',
  key: '1405409603010977',
  secret: '72712d7f5780efbac72e28add09b1ec0',
  path: 'facebook'
)


puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

Configuration.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'
