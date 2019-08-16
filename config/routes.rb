Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      resources :posts, only: [:index, :show, :create, :destroy, :update]
    end
  end
end
