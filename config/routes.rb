Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      namespace :v1 do
        resources :decks
        # post 'decks/new', :to => 'decks#new'
        post '/new_deck_cards', to: "decks#new"
        resources :cards
        resources :deck_cards



      end
    end
end



#
#
# resources :decks do
#   get 'new_deck', to: 'decks#new_deck', as: :new_deck
#   resources :cards do
#   get 'new_card', to: 'cards#new_card', as: :new_card
#   end
# end
