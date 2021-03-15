Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resource :teacher, only: [:show, :edit, :update]

  resources :courses do
    resources :students, only: [:new, :create, :edit, :update]
    # aristutor.co/courses/students/42 here we are on student id:42

    # review where update and edit really needed
    resources :summaries, only: [:create, :edit, :update]
    # aristutor.co/courses/:courses_id/summary/:id/edit

  end

  resources :summaries, only: [:index, :show, :edit, :update] do
    # aristutor.co/summaries/54 here we are on summary id:54
    # aristutor.co/summaries/55/edit here we are on summary id:55
    member do
      patch :send_summary # to be reviewed
      # aristutor.co/summaries/54/send
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

end
