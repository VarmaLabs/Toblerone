Rails.application.routes.draw do

  root 'welcome#home'

  # -----------
  # API Routes
  # -----------

  namespace :api do
    namespace :v1 do
      get 'info/server' => 'info#server'
    end
  end

end
