# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'home#index'

  resource :sign_up, only: %i[new create]
  resource :sign_in, only: %i[new create destroy]
  resource :reset_password, only: %i[new create]

  scope :me do
    resources :widgets, only: %i[index show create destroy update new]
  end
end
