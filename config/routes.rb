Rails.application.routes.draw do
  resources :pages, only: [:index, :create]
  match 'scrap' => 'pages#create', :via => :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
