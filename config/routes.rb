Lxrck::Application.routes.draw do
  	resources :messages


	root :to => 'pages#home'
	match 'tellme' => 'pages#tellme'
	match 'bgs' => 'pages#backgroundvideo'
	match 'bg2' => 'pages#bg2'
	match 'bg3' => 'pages#bg3'
	match 'icons' => 'pages#icons'
	match 'example' => 'pages#example'

end
