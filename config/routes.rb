Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      shallow do
        resources :applications, only: %i[index create update], param: :token do
          resources :chats, only: :index, param: :number do
            resources :messages, only: %i[index update], param: :number
          end
        end
      end

      resources :messages, only: [] do
        collection { get :search }
      end
    end
  end
end
