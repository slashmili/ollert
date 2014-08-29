class Api::V1::CardsController < ApplicationController
  respond_to :json
  before_action :has_access?, only: [:create]
  before_action :set_card, only: [:update, :show]
  skip_before_filter :authenticate_user!, only: [:show]

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize! :edit, @card
    p params
    @card.tags = params[:card][:tags] || []
    if @card.update(card_params)
        render json: @card, status: :ok, location: @card
    else
        render json: @card.errors, status: :unprocessable_entity
    end
  end

  def show
    authorize! :read, @card
    render json: @card, status: :ok, location: @card
  end

  private
  def set_card
    @card = Card.find(params[:id])
  end


  def has_access?
    current_user.lists.find(card_params[:list_id])
  end

  def card_params
    params.require(:card).permit(:id, :title, :position, :list_id, :description, tags: [])
  end
end
