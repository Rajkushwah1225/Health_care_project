Rails.application.routes.draw do
devise_for :users
  # For the home page, we'll just redirect to the patients index if the user is signed in.
  root "patients#index"
  # This line provides all the standard CRUD routes for patients.
  resources :patients
end