module Api
  module V1
    class ConditionsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ActionController::ImplicitRender

      before_action :restrict_access
      respond_to :json

      def index
        respond_with(Condition.all.order("grade DESC"))
      end

      def show
        respond_with(Condition.find(params[:id]))
      end

      def create
        @condition = Condition.new(conditions_params)
        if @condition.save
          respond_to do |format|
            format.json { render :json => @condition }
          end
        end
      end

      def update
        @condition = Condition.find(params[:id])
        if @condition.update(conditions_params)
          respond_to do |format|
            format.json { render :json => @condition }
          end
        end
      end

      def destroy
        respond_with(Condition.destroy(params[:id]))
      end

  private
      def conditions_params
        params.permit(:grade)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

    end
  end
end