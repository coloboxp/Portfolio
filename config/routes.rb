Rails.application.routes.draw do
  resources :portfolios
  #get 'pages/home'
  get 'about', to: "pages#about"
  get 'contact', to: "pages#contact"
  get 'learning', to: "pages#learning"
  get 'interest', to: "pages#interest"
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
