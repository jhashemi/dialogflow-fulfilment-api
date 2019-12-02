# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :dialogflow do
      resources :fulfilments, only: :create
    end
  end
end
