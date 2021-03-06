# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: false, constraints: { id: %r{[^/]+} } do
    resources :categories
    resources :questions, only: [:index]

    resources :users, only: [:show] do
      resources :questions do
        resources :likes, controller: 'like_questions', only: %i[new create destroy], as: :like_questions
      end

      resources :answers, only: %i[new create index edit update destroy]

      resources :answers, only: [:show] do
        resources :likes, controller: 'like_answers', only: %i[new create destroy], as: :like_answers
      end

      resources :followers, only: %i[new create destroy], controller: 'connections'
      resources :followers, only: [:index], to: 'connections#followers'
      resources :following, only: [:index], to: 'connections#following'

      resources :likes, to: 'users#likes', only: [:index]
    end

    get '/signup', to: 'users#new', as: 'signup'
    resources :users, only: [:create], path: 'signup'
    resources :users, only: %i[edit update]

    get '/search', to: 'search#index', as: 'search'

    get '/', to: 'welcome#home', as: 'root', controller: 'welcome'
    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: 'logout'
  end
  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
