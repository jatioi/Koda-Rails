Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  get :about, to: 'welcome#about'
  get :contact, to: 'welcome#contact'
  resources :feedbacks do
    resources :notes
  end
  resources :posts do
    resources :comments
  end
  resources :categories, except: :show
end


