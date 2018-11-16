class Api::V1::CardsController < Api::ApplicationController
  before_action :set_cards, only: %i[index]
end
