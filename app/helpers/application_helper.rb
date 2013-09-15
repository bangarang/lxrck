module ApplicationHelper

	def avatar_url(size)
		me = "me@alexjrock.com"
	    gravatar_id = Digest::MD5.hexdigest(me)
	    "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}.png"
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

	def full_title(page_title)
	    base_title = "Alex Rock's Escapade."
	    if page_title.empty?
	      base_title
	    else
	      "#{page_title} | #{base_title}"
	    end
	end

  	def standard
  		provide(:head, 'og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/website#')
  		provide(:type, 'website')
  		provide(:url,  request.original_url)
  		provide(:ogtitle, "Alex Rock's Escapade." )
  		provide(:description, "Points to make and Tangents to take.")
  		provide(:image, avatar_url(500))
  	end

	def meta(item)
		if item.type == :point
			provide(:head, 'og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# article: http://ogp.me/ns/article#"')
	  		provide(:type, 'article')
	  		provide(:url,  point_url(item))
	  		provide(:ogtitle, item.name )
	  		provide(:description, item.tldr)
	  		provide(:image, item.image_url(:thumb))
	  	end
  	end

  	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
		  render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end
end