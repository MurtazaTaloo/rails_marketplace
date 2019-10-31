Rails.application.routes.draw do
  root to: "pages#home"
  
  get 'profiles/user_profile', to: "profiles#user_profile"
  
  get 'pages/home'
  get 'pages/about_us'
  get 'pages/contact_us'

  get 'listings/type_selection', to: "listings#type_selection"
  resources :listings
  # get "/payments/success", to: "payments#success"


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
