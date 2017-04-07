Rails.application.routes.draw do
  devise_for :users
    root to: 'pages#home'
    get '/about', to: 'pages#about' 
    resources :contacts, only: :create
    get 'contact-us', to: 'contacts#new', as: 'new_contact'
    # get request for "contact-us" webpage then goes to contacts *controller *new action
end
