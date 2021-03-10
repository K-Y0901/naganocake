Rails.application.routes.draw do

  root :to =>"public/homes#top"

  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }


   resources :end_users, only: [:show,:edit,:destroy,:update] do
     collection do
      get :confirm
    end
   end

   resources :items,only: [:index, :show]
   resources :cart_items, only: [:index, :update, :destroy, :create] do
     collection do
       delete :destroy_all
     end
   end
   resources :orders, only: [:new, :create, :index, :show] do
       collection do
           post :confirm
           post :complete
       end
   end
   resources :addresses




  namespace :admin do
    get '/', to: 'homes#top'
    resources :end_users
    resources :genres
    resources :items
    resources :orders
    resources :order_items
  end


end
