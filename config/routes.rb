Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resource :teachers, only: [:show, :edit, :update]

  resources :courses do
    resources :students, only: [:new, :create, :edit, :update]
    # aristutor.co/courses/students/42 here we are on student id:42
    resources :summaries, only: [:new, :create]
    # aristutor.co/courses/:courses_id/summary/new
  end

  resources :summaries, only: [:index, :show, :edit, :update] do
    # aristutor.co/summaries/54 here we are on summary id:54
    # aristutor.co/summaries/55/edit here we are on summary id:55
    member do
       patch :send
      # aristutor.co/summaries/54/send
     end
  end

  get '/components', to: 'pages#components'
  get '/translation', to: 'pages#translation'
end
