module Api
  module V1
    class SportsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ActionController::ImplicitRender

      before_action :restrict_access
      respond_to :json

      def index
        respond_with(Sport.all)
      end

      def show
        respond_with(Sport.find(params[:id]))
      end

      def create
        @sport = Sport.new(sports_params)
        if @sport.save
          respond_to do |format|
            format.json { render :json => @sport }
          end
        end
      end

      def update
        @sport = Sport.find(params[:id])
        if @sport.update(sports_params)
          respond_to do |format|
            format.json { render :json => @sport }
          end
        end
      end

      def destroy
        respond_with(Sport.destroy(params[:id]))
      end

  private
      def sports_params
        params.permit(:name)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

    end
  end
end