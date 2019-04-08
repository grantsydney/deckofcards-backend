Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        resources :decks, only: [:index, :show]
        get '/deck/:id', to: "decks#current_deck_cards"
        get '/deck/:id/draw', to: "decks#draw_five"
        get '/deck/:id/remaining', to: "decks#remaining"
        post '/new', to: "decks#create"
        resources :cards, only: [:index, :show, :create]
        resources :deck_cards, only: [:index, :create]
      end
    end
end
