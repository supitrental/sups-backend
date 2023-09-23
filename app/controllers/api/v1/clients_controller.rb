# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      before_action :find_client, only: %i[show update destroy]

      def index
        @clients = Client.all
      end

      def show; end

      def create
        @client = Client.create(name: default_params[:name])
        render status: :unprocessable_entity if @client.errors.present?
      end

      def update
        @client.update(name: default_params[:name])
        render status: :unprocessable_entity if @client.errors.present?
      end

      def destroy
        @client.delete
        render status: :no_content
      end

      def find_client
        @client = Client.by_id(id).first

        render status: :not_found if @client.nil?
      end

      def id
        params[:id]
      end

      def default_params
        params.permit(:name)
      end
    end
  end
end
