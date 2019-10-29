Rails.application.routes.draw do
  root to: "pages#home"
  
  get 'pages/home'
  get 'pages/about_us'
  get 'pages/contact_us'

  resources :listings

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  

end
