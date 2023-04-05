Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :b_questions 
      resources :t_questions 
      resources :users 
      get "/login", to: "users#login"
    end
  end

end
