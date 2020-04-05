Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tasks#index'

  resources :tasks, except: :show do
    member do
      patch :done
    end
  end
  
  resources :categories, except: :show
end
