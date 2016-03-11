Rails.application.routes.draw do
  root to: "companies#new"

  devise_for :company_users, controllers: { registrations: 'company_users/registrations' }
  devise_scope :company_user do
    get 'sucesso',   to: 'company_users/registrations#success', as: :success_sign_up
  end

  namespace :dashboard do
    root to: 'dashboard#index'

    with_options except: :show do
      resources :roles,       path: 'cargos'
      resources :periods,     path: 'periodos'
      resources :frequencies, path: 'frequencias'
    end
  end

  resources :companies, only: [:new, :create]
end
