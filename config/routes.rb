Rails.application.routes.draw do

  root 'grades#index'

  resources :students, except: [:index, :new, :edit, :show]

  get '/grades/:grade_id/sections/:id/students/new', to: 'students#new'

  get '/grades/:grade_id/sections/:id/students/:student_id/edit', to: 'students#edit'

  get '/grades/:grade_id/sections/:id/students/:student_id', to: 'students#show' 

  resources :grades

  get '/grades/:grade_id/sections/:id', to: 'sections#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
