Lxrck::Application.routes.draw do
  resources :messages


	root :to => 'pages#home'
	match 'tellme' => 'pages#tellme'

end
