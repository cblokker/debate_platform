Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout

  get 'debates/popular' => 'debates#index_popular', :as => :popular_debates
  get 'debates/agree' => 'debates#index_agree', :as => :agree_debates
  get 'debates/disagree' => 'debates#index_disagree', :as => :disagree_debates

  resources :users
  resources :debates do
    resources :comments do
      resources :votes
    end
  end
  root 'sessions#new'
end
