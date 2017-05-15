Rails.application.routes.draw do

	namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :players
      resources :companies
      resources :sports
      resources :conditions
    end
  end

end
