module Api
  module V1
    class CardsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ActionController::ImplicitRender

      before_action :restrict_access
      respond_to :json

      def index
        respond_with(Card.all)
      end

      def show
        respond_with(Card.find(params[:id]))
      end

      def create
        @card = Card.new(cards_params)
        if @card.save
          respond_to do |format|
            format.json { render :json => @card }
          end
        end
      end

      def update
        @card = Card.find(params[:id])
        if @card.update(cards_params)
          respond_to do |format|
            format.json { render :json => @card }
          end
        end
      end

      def destroy
        respond_with(Card.destroy(params[:id]))
      end

  private
      def cards_params
        params.permit(:player_id, :team_id, :company_id, :condition_id, :card_number, :year, :rookie_year, :autograph, :sale_price, :guide_price)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

    end
  end
end