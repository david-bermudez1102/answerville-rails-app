Rails.application.routes.draw do
  resources :categories
  resources :questions, only:[:index]

  resources :users do
    resources :questions do
      resources :likes, controller: 'like_questions', only:[:new,:create,:destroy], as: :like_questions
      resources :answers, only:[:new,:create]
    end

    resources :answers, only:[:index,:edit,:update,:destroy]

    resources :answers, only:[:show] do
      resources :likes, controller: 'like_answers', only:[:new,:create,:destroy], as: :like_answers
    end
  end

  get '/', to:'welcome#home', as:'root'
  get 'login', to:'sessions#new', as:'login'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy', as:'logout'
  get 'signup', to:'users#new', as:'signup'
  post 'signup', to:'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
