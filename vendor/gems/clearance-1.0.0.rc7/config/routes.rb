Rails.application.routes.draw do
  # resources :passwords,
  #   :controller => 'clearance/passwords',
  #   :only => [:create, :new]

  resource :session,
    :controller => 'clearance/sessions',
    :only => [:create, :new, :destroy]

  # resources :users,
  #   :controller => 'clearance/users',
  #   :only => [:create, :new] do
  #     resource :password,
  #       :controller => 'clearance/passwords',
  #       :only => [:create, :edit, :update]
  #   end

  get '/session/born' => 'clearance/sessions#new', :as => 'born'
  delete '/session/kill' => 'clearance/sessions#destroy', :as => 'kill'
  # get '/sign_up' => 'clearance/users#new', :as => 'sign_up'
end
