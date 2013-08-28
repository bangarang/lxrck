Lxrck::Application.routes.draw do
  	resources :posts
  	resources :photos
	root :to => 'pages#home'
	match 'in' => 'pages#in'
	match 'styles' => 'pages#styles'

	get '/login' => 'clearance/sessions#new', :as => 'born'
	# get '/sign_up' => 'clearance/users#new', :as => 'sign_up'
	delete '/logout' => 'clearance/sessions#destroy', :as => 'kill'
	resources :tags


	# root :controller => "tags", :action => "index"
	# match "/:id" as :tags
end
