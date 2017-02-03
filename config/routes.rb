Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get "about",to: "pages#about"
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: "new_contact" #changes path of new_contact to path contact-me, allowing application view file to need no changing 
  get 'example', to: "pages#example"
end
