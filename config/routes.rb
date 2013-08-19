Lxrck::Application.routes.draw do
  	resources :posts
  	resources :photos
	# root :to => 'pages#home'
	match 'in' => 'pages#in'

  get '/sign_in' => 'clearance/sessions#new', :as => 'born'
  delete '/sign_out' => 'clearance/sessions#destroy', :as => 'kill'
	resources :tags, :path => "/"

	# root :controller => "tags", :action => "index"
	# match "/:id" as :tags
end
