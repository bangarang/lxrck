# config/initializers/paperclip.rb 
Paperclip::Attachment.default_options[:url] = ENV['AWS_BUCKET']
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'