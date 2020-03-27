Rails.application.routes.draw do

  
  root 'grades#index'

  resources :students, except: [:index, :new, :edit, :show]

  get '/grades/:grade_id/sections/:id/students/new', to: 'students#new', as: 'new_student'

  get '/grades/:grade_id/sections/:id/students/:student_id/edit', to: 'students#edit', as: 'edit_student'

  get '/grades/:grade_id/sections/:id/students/:student_id', to: 'students#show', as: "student_show"

  resources :grades

  get '/grades/:grade_id/activities', to: 'grades#activities', as: "grade_activities"

  get '/grades/:grade_id/sections/:id', to: 'sections#show', as: 'section'

  resources :speakings, except: [:new, :show]

  get "/grades/:grade_id/speaking/new", to: 'speakings#new', as: "new_speaking"

  patch "/grades/:grade_id/speakings", to: "speakings#update_speaking_enrollments", as: "update_speaking_enrollments"

  resources :writings, except: [:new, :show]

  get "/grades/:grade_id/writing/new", to: 'writings#new', as: "new_writing"

  patch "/grades/:grade_id/writings", to: "writings#update_writing_enrollments", as: "update_writing_enrollments"

  resources :listenings, except: [:new, :show]

  get "/grades/:grade_id/listening/new", to: "listenings#new", as: "new_listening"

  patch "/grades/:grade_id/listenings", to: "listenings#update_listening_enrollments", as: "update_listening_enrollments"

  resources :readings, except: [:new, :show]

  get "/grades/:grade_id/reading/new", to: "readings#new", as: "new_reading"

  patch "/grades/:grade_id/readings", to: "readings#update_reading_enrollments", as: "update_reading_enrollments"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
