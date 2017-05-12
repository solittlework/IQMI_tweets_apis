Rails.application.routes.draw do
  resources :tweets do
      collection do
        post 'fetch_remote_data'
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"

end
