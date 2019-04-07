Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        resources :decks
        get '/deck/:id', to: "decks#current_deck_cards"
        get '/deck/:id/draw', to: "decks#draw_five"
        post '/new', to: "decks#create"
        get '/draw', to: "decks#draw_five"
        resources :cards
        resources :deck_cards
      end
    end
end
