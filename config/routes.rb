Rails.application.routes.draw do
  mount Csvreader::Api, at: 'api'

  root to: 'loans#index'

  resources :loans, only: :index
end
