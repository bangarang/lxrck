CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    :region                 => 'us-west-2',
    # :host                   => 'assets.lxrck.com',
    # :endpoint               => 'http://assets.lxrck.com'
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.s3_access_policy = :public_read
  config.fog_directory = ENV['AWS_BUCKET']
end