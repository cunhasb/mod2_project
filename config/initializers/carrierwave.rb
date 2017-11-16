CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAITADSYZMPOI4WX7Q',                        # required
    aws_secret_access_key: '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',                        # required
  }
  config.fog_directory  = 'loveappimages'                          # required
end
