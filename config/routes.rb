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


   resources :end_users, only: [:show,:edit,:confirm,:destroy,:update]
  
  
  
  namespace :admin do
    get '/', to: 'homes#top'
  end


end
