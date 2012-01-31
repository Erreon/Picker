Picker::Application.routes.draw do
  resources :products do
    member do
      get 'up_vote'
      get 'down_vote'
    end
  end
  root :to => 'products#index'
end
