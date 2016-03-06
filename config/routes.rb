Rails.application.routes.draw do
  root to: "companies#new"

  devise_for :company_users, controllers: { registrations: 'company_users/registrations' }
  devise_scope :company_user do
    get 'sucesso',   to: 'company_users/registrations#success', as: :success_sign_up
  end

  namespace :dashboard do
    root to: 'dashboard#index'
    resources :roles, except: :show, path: 'cargos'
  end

  resources :companies, only: [:new, :create]
end
