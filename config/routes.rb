Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :urls
  # Defines the root path route ("/")
  # root "articles#index"
  get ':url_string', to: 'urls#redirect' 
  root to: 'urls#index'
end
