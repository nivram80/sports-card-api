module Api
  module V1
    class TeamsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ActionController::ImplicitRender

      before_action :restrict_access
      respond_to :json

      def index
        respond_with(Team.all)
      end

      def show
        respond_with(Team.find(params[:id]))
      end

      def create
        @team = Team.new(teams_params)
        if @team.save
          respond_to do |format|
            format.json { render :json => @team }
          end
        end
      end

      def update
        @team = Team.find(params[:id])
        if @team.update(teams_params)
          respond_to do |format|
            format.json { render :json => @team }
          end
        end
      end

      def destroy
        respond_with(Team.destroy(params[:id]))
      end

  private
      def teams_params
        params.permit(:city, :mascot, :sport_id)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

    end
  end
end