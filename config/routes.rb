Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # post 'reporte', to: 'divisas#scraping', defaults: { format: :json }


  root "divisas#scraping"
end
