Lxrck::Application.routes.draw do
  	resources :posts
  	resources :photos
	# root :to => 'pages#home'
	match 'in' => 'pages#in'
	resources :tags, :path => "/"



	# root :controller => "tags", :action => "index"
	# match "/:id" as :tags
end
