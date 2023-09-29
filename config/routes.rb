Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root 'welcome#index'
  get :about, to: 'welcome#about'
  get :contact, to: 'welcome#contact'
  resources :posts
  resources :feedbacks
  resources :feedbacks, only: [:new, :create]

end


#hello, about page, contact page, root, get