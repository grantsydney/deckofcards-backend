class Api::V1::CardsController < ApplicationController


  def index
    @cards = Card.all
    render json: @cards
  end


  def create
    @card = Card.create(card_params)
    if @card.valid?
      render json: @card, status: :created
    else
      render json: @card.errors.full_messages, status: :unprocessable_entity
    end
  end

  def new
    @card = Card.new
  end

  private

  def card_params
    params.permit(:rank, :suit, :id)
  end


end
