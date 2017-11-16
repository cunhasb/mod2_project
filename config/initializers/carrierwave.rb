CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIEEV45IMOHAHKSYQ',                        # required
    aws_secret_access_key: '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',                        # required
  }
  config.fog_directory  = 'loveappimages'                          # required
end
