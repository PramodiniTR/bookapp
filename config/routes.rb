Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
             #default_url_options :host => "example.com"

  resources :authors
  resources :books

end

