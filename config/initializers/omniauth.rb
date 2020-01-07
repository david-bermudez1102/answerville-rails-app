Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], display: 'popup', :image_size => 'large'
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    name: 'google',
  }
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user"
end