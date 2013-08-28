CarrierWave.configure do |config|
  config.storage = :fog,
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: 		ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: 	ENV['AWS_SECRET_ACCESS_KEY'],
    region:                	ENV['S3_REGION']
    # :host                   => 'assets.lxrck.com',
    # :endpoint               => 'http://assets.lxrck.com'
  }
  config.fog_directory = ENV['AWS_BUCKET']
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end