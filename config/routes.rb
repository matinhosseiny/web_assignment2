Rails.application.routes.draw do
  
  get 'sessions/new'

  resources :users
root 'static_pages#home'
get  '/signup',  to: 'users#new'
get 'scoresheets' => 'scoresheets#index'
get 'scoresheets/:id' => 'scoresheets#edit'
post 'scoresheets/:id' => 'scoresheets#edit'
patch 'scoresheets/:id' => 'scoresheets#update'
#get '/scoresheets/edit', to: 'scoresheets#edit'
post '/signup',  to: 'users#create'
get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
resources :scoresheets,  only: [:index, :create, :destroy, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
