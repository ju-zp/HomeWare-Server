Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #user routes
  post 'login', to: 'users#login'
  post 'signup', to: 'users#signup'
  post 'validate', to: 'users#validate'
  post 'logout', to: 'users#logout'
  post 'create', to: 'users#create'
  post 'destroy', to: 'users#destroy'

  #home routes
  post 'edit', to: 'home#edit'

  #light routes
  post 'setLight', to: 'lights#setLight'

  #temperature routes
  post 'reading', to: 'temperatures#reading'
  get 'temperatures', to: 'temperatures#getTemperatures'

  #color routes
  post 'color', to: 'colors#saveColor'
  post 'colors', to: 'colors#getColors'

  #environment routes
  post 'environment', to: 'environment#getEnvironment'
  get 'weather', to: 'environment#getWeather'
end
