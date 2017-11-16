CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIFRJ3QBX3EEFJ2KQ',                        # required
    aws_secret_access_key: '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',                        # required
  }
  config.fog_directory  = 'loveappimages'                          # required
end
