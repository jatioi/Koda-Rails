Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root 'welcome#index'
  get :about, to: 'welcome#about'
  get :contact, to: 'welcome#contact'
  resources :posts
  get '/feedback', to: 'feedback#new', as: 'new_feedback'
  post '/feedback', to: 'feedback#create'
end


#hello, about page, contact page, root, get