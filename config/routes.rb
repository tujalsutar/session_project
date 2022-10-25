Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'registrations#index'
  # root 'welcome#index'


  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  # patch 'edit', to: 'registrations#update'

  get 'registrations/:id', to: 'registrations#edit', as: 'edit_user'
  patch 'registrations/', to: 'registrations#update'

  #  get 'sessions', to: 'sessions#edit', as: 'edit_user'
  # patch 'sessions', to:'sessions#update'
  resources :users do
     resources :posts
 end

 resources :posts do
     resources :comments 
 end

end
