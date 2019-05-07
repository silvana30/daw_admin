Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :update, :destroy]
  resolve("Users") { route_for(:users) }
  resources :medical_units, only: [:index, :show, :update, :destroy]
  resolve("MedicalUnits") { route_for(:medical_units) }

  resources :doctors, only: [:index, :show, :update, :destroy]
  resolve("Doctors") { route_for(:doctors) }

  resources :comments, only: [:index, :show, :update, :destroy]
  resolve("Comments") { route_for(:comments) }


end
