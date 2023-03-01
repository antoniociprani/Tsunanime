Rails.application.routes.draw do

 
  
  
  resources :profiles
  resources :animes do
    resources :reviews, except: [:show, :index]
    member do
      post 'toggle_favorite', to: 'animes#toggle_favorite'
    end
  end


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , registrations: 'users/registration_s'  }

  #get 'home/index'
  root 'home#index'

  get "/:page" => "static#show"

  get 'top5/index' => "top5#index"

  get 'profiles/:user_id' => "profiles#index"
  
  get 'tools/index' => "tools#index"

  get 'tools/update' => "tools#update"

  get 'tools/downgrade' => "tools#downgrade"

  get 'tools/ban' => "tools#ban"

  get 'tools/unban' => "tools#unban"



  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
