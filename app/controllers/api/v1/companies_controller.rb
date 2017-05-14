module Api
  module V1
    class CompaniesController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ActionController::ImplicitRender

      before_action :restrict_access
      respond_to :json

      def index
        respond_with(Company.all)
      end

      def show
        respond_with(Company.find(params[:id]))
      end

      def create
        @company = Company.new(companies_params)
        if @company.save
          respond_to do |format|
            format.json { render :json => @company }
          end
        end
      end

      def update
        @company = Company.find(params[:id])
        if @company.update(companies_params)
          respond_to do |format|
            format.json { render :json => @company }
          end
        end
      end

      def destroy
        respond_with(Company.destroy(params[:id]))
      end

  private
      def companies_params
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