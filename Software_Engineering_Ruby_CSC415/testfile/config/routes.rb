Rails.application.routes.draw do
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'resumes#index'
end
