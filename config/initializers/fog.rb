CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      'AKIAJSPUF6AGBILOZM6Q',
    aws_secret_access_key:  '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'
  }
  config.fog_directory  = ENV['AWS_BUCKET']
  config.fog_public     = true
end