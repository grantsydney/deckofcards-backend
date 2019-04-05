class Deck < ApplicationRecord
  has_many :deck_cards
  has_many :cards, through: :deck_cards



  def new_deck
    Card.all.each do |card|
      DeckCard.create(deck_id: self.id,  card_id: card.id, drawn: false)
    end
  end



end
