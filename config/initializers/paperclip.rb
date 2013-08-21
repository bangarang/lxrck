Paperclip::Attachment.default_options.update({
  :path => ":class/:attachment/:id_partition/:style/:filename",
  :storage => :fog,
  :fog_credentials => {
    :provider  				=> 'AWS',
    :region					=> 'us-west-2',
	:aws_access_key_id 		=> ENV['AWS_ACCESS_KEY_ID'],
	:aws_secret_access_key 	=> ENV['AWS_SECRET_ACCESS_KEY']
  },
  :fog_directory => ENV['AWS_BUCKET'],
  :fog_public => true,
  :fog_host => 'http://assets.lxrck.com'
})