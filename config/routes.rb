Rails.application.routes.draw do

  resources :students
  root 'grades#index'

  resources :grades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
