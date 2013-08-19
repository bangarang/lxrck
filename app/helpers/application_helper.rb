module ApplicationHelper

	def avatar_url()
		me = "me@alexjrock.com"
	    gravatar_id = Digest::MD5.hexdigest(me)
	    "http://gravatar.com/avatar/#{gravatar_id}?s=200.png"
	end
	
	def markdown(text)
		# markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :hard_wrap => true, fenced_code_blocks: true, :prettify => true)
		# markdown = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)
		# markdown.render(text).html_safe
		rnder = Redcarpet::Render::HTML.new(:prettify => true)
		mkdwn = Redcarpet::Markdown.new(rnder, :no_intra_emphasis => true, :fenced_code_blocks => true, :space_after_headers => true)
		mkdwn.render(text).html_safe
	end

	def active_class?(*paths)
	  active = false
	  paths.each { |path| active ||= current_page?(path) }
	  active ? 'active' : nil
	end
end