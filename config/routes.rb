Rails.application.routes.draw do
  root to: 'patients#index'
  resources :diagnoses, :doctors
  resources :patients do
    resources :visits
  end
end
