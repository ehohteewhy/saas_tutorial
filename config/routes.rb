Rails.application.routes.draw do
    root to: "pages#home"
    get "about",to: "pages#about"
    resources :contacts, only: :create
    get 'contact-me', to: 'contacts#new', as: "new_contact" #changes path of new_contact to path contact-me, allowing application view file to need no changing 
end
