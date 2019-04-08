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

  def new
    target_id = params[:id].to_i
    @deck = Deck.find_by(id: target_id)
    @deck.new_deck
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

  def destroy
  @deck.destroy
  render json: {message: "deck deleted"}, status: :ok
end


  private

  def deck_params
    params.permit(:id)
  end


end
