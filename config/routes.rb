Lxrck::Application.routes.draw do
	root :to => 'pages#home'
	match 'in' => 'pages#in'
end
