 Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], scope: 'public_profile, user_birthday', info_fields: 'birthday,gender,currency, first_name, last_name, email'
  end