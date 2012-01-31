Picker::Application.routes.draw do
  resources :product
  match 'product/up_vote/:id' => 'product#up_vote', :as => 'up_vote'
  match 'product/down_vote/:id' => 'product#down_vote', :as => 'down_vote'
  root :to => 'product#index'

end
