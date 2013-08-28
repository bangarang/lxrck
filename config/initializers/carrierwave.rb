CarrierWave.configure do |config|
  config.storage = :fog,
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: 		'AKIAIZUTKKQXQPSDMPPQ',
    aws_secret_access_key: 	'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',
    region:                	'us-west-2'
    # :host                   => 'assets.lxrck.com',
    # :endpoint               => 'http://assets.lxrck.com'
  }
  config.fog_directory = 'assets.lxrck.com'
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end