class Api::V1::DeckCardsController < ApplicationController

  def index
    @deck_cards = DeckCard.all
    render json: @deck_cards
  end

  def create
    @deck_card = DeckCard.create(deckcard_params)
    if @deck_card.valid?
      render json: @deck_card, status: :created
    else
      render json: @deck_card.errors.full_messages, status: :unprocessable_entity
    end
  end



  private
    def deckcard_params
      params.require(:deck_card).permit(:deck_id, :card_id, :drawn)
    end
end
