Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resource :teacher, only: [:show, :edit, :update] do
    resources :summaries, only: [:index]
  end


  resources :courses do
    resources :students, only: [:new, :create, :edit, :update]
    # aristutor.co/courses/new

    resources :summaries, only: [:new, :create, :edit, :update]
    # aristutor.co/courses/:courses_id/summary/new

  end

  resources :summaries, only: [:show] do
    # aristutor.co/summaries/54 here we are on summary id:54
    # aristutor.co/summaries/55/edit here we are on summary id:55
    member do
      patch :send_flashcards # to be reviewed
    end
    resource :flashcards, only: [:show] do
      member do
        patch :passed
        patch :failed
        get :success
      end
    end

  end

  get '/components', to: 'pages#components'


  mount API::Base, at: "/"

end
