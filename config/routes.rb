Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendees, :controller => "event_attendees"

    collection do
      get :latest

      # post :bulk_delete
      post :bulk_update
    end

    member do
      get :dashboard
    end
  end

  namespace :admin do
    resources :events
  end

  resources :people

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say_hello" => "welcome#say"

  get "welcome" => "welcome#index"

  root 'welcome#index'




  # match ':controller(/:action(/:id(.:format)))', :via => :all
end
