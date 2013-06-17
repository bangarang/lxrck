module ApplicationHelper

	def avatar_url()
		me = "me@alexjrock.com"
	    gravatar_id = Digest::MD5.hexdigest(me)
	    "http://gravatar.com/avatar/#{gravatar_id}?s=200.png"
	end


end
