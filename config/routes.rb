Codeable::Application.routes.draw do

  resources :assignments

  namespace :admin do
    resources :assignments
  end

  mount StripeEvent::Engine => '/stripe'
  get "content/evening"
  get "content/gold"
  get "content/silver"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
end
