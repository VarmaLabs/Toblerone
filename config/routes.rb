Rails.application.routes.draw do

  # -----------
  # GUI Routes
  # -----------

  # Public Routes
  root 'gui/sessions#new'

  get 'sign_in'       => 'gui/sessions#new',                as: :sign_in
  post 'authenticate' => 'gui/sessions#create',             as: :authenticate

  # Authenticated Routes | Inner Pages
  delete 'sign_out'              => 'gui/sessions#destroy',              as: :sign_out
  get    'my_home'               => 'gui/users/personal#my_home',        as: :my_home
  get    'my_profile'            => 'gui/users/personal#my_profile',     as: :my_profile
  put    'my_profile/update'     => 'gui/users/personal#update_profile', as: :update_profile

  # -----------
  # API Routes
  # -----------

  namespace :api do
    namespace :v1 do
      get 'info/server' => 'info#server'
    end
  end

end
