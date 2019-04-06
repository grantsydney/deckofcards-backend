class Deck < ApplicationRecord
  has_many :deck_cards
  has_many :cards, through: :deck_cards



  def new_deck
    Card.all.each do |card|
      DeckCard.create(deck_id: self.id,  card_id: card.id, drawn: false)
    end
  end

  def remaining_cards
    self.deck_cards.where(drawn: false).map do |dc|
      dc
    end
  end

  def draw(num = 5)
    drawn = self.remaining_cards.sample(num)
    drawn.each do |card_drawn|
      card_drawn.update(drawn: true)
    end
    return drawn
  end


end
