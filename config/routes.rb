Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #user routes
  post 'login', to: 'users#login'
  post 'signup', to: 'users#signup'
  post 'validate', to: 'users#validate'
  post 'logout', to: 'users#logout'

  #temperature routes
  post 'reading', to: 'temperatures#reading'

  #color routes
  post 'color', to: 'colors#saveColor'
  get 'colors', to: 'colors#getColors'
end
