Rails.application.routes.draw do
  root to: "pages#home"
  
  get 'profiles/user_profile', to: "profiles#user_profile"
  get 'profiles/user_profile/rate_seller', to: "profiles#rate_seller"
  # get 'user_path', to: "profiles#rate_seller"
  
  post 'user/rate', to: "profiles#rate_score", as: "rate_seller"
  
  
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
