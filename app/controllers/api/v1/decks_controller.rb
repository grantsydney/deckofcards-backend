class Api::V1::DecksController < ApplicationController


  def index
    @decks = Deck.all
    render json: @decks
  end

  def show
    @deck = Deck.find_by(id: params[:id])
    render json: @deck
  end

  def create
    @deck = Deck.create(deck_params)
    @deck.new_deck
    if @deck.valid?
      render json: @deck, status: :created
    else
      render json: @deck.errors.full_messages, status: :unprocessable_entity
    end
  end


  def current_deck_cards
    @current_deck_cards = Deck.where(id:params[:id])
    render json: @current_deck_cards, status: :ok
  end

  # get deck instance and call drawn fn to return 5 draw cards
  # render those 5 cards
  def draw_five
    @deck = Deck.find(params[:id])
    @drawn_deck_cards = @deck.draw
    render json: @drawn_deck_cards
  end

  ## fn for obtaining remaining num of cards in deck not drawn
  def remaining
    @deck = Deck.find(params[:id])
    @remaining_cards = @deck.remaining_cards
    render json: @remaining_cards
  end

  private

  def deck_params
    params.permit(:id)
  end


end
