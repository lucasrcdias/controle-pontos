Rails.application.routes.draw do
  root to: "statics#home"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }, path: '', path_names: {
    sign_in: 'entrar', sign_out: 'sair', password: 'senha', confirmation: 'confirmacao', unlock: 'desbloquear', sign_up: 'cadastre-se', edit: 'alterar', new: 'nova'
  }

  devise_scope :user do
    get 'sucesso', to: 'users/registrations#success', as: :success_sign_up
  end

  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1 do
      resource  :login,   only: [:create, :destroy]
      resources :periods, only: [:index]
      resources :points,  only: [:create]
    end
  end

  namespace :dashboard do
    root to: 'dashboard#index'

    with_options except: :show do
      resources :roles,       path: 'cargos'
      resources :periods,     path: 'periodos'
      resources :frequencies, path: 'frequencias'
    end

    resources :workers
  end

  resources :companies, except: :destroy
end
