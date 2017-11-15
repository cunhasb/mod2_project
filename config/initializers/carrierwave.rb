CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJ7TWXKK4F5ISYHSA',                        # required
    aws_secret_access_key: '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',                        # required
  }
  config.fog_directory  = 'loveappimages'                          # required
end
