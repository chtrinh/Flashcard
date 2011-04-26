Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '180346615336663', 'd6e30d6ede0f5ccaededd0fcf2a95ddc'
end