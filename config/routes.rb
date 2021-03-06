Rails.application.routes.draw do
  match '*any' => 'application#options', via: [:options]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :albums, except: [:destroy] do
    collection do
      get :fetch_folder_id
      match :test_fb, via: [:get, :post]
    end
  end
end
