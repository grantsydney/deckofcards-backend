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


  private

  def deck_params
    params.permit(:id)
  end


end
