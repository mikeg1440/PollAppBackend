Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      resources :polls, only: [:index, :create, :show] do
        resources :submissions, only: [:index, :create]
      end

    end
  end

end
