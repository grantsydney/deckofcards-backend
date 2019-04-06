class DeckCardSerializer < ActiveModel::Serializer
  attributes :id, :deck_id, :card_id, :drawn
  
end
