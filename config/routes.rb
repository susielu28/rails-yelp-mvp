Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Read all

  Rails.application.routes.draw do
    resources :restaurants, only: [:index, :new, :create, :show] do
      resources :reviews, only: [:new, :create]
    end
  end


  # List all restaurants
get '/restaurants', to: 'restaurants#index'

# Show the form to create a new restaurant
get '/restaurants/new', to: 'restaurants#new'

# Create a new restaurant
post '/restaurants', to: 'restaurants#create'

# Show a specific restaurant and its reviews
get '/restaurants/:id', to: 'restaurants#show'

# Show the form to create a new review for a specific restaurant
get '/restaurants/:restaurant_id/reviews/new', to: 'reviews#new'

# Create a new review for a specific restaurant
post '/restaurants/:restaurant_id/reviews', to: 'reviews#create'

end
