Rails.application.routes.draw do
  resources :categories
  resources :like_answers
  resources :like_questions
  resources :answers
  resources :questions
  get '/', to:'welcome#home'
  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  get 'signup', to:'users#new', as:'signup'
  post 'signup', to:'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
