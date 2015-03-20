Rails.application.routes.draw do
  root to: 'patients#index'
  resources :patients, :diagnoses, :doctors
end
