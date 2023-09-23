# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      before_action :find_address, only: %i[show update destroy]

      def index
        @addresses = Address.all
      end

      def show; end

      def create
        @address = Address.create(address_params)
        render status: :unprocessable_entity if @address.errors.present?
      end

      def update
        @address.update(address_params)
        render status: :unprocessable_entity if @address.errors.present?
      end

      def destroy
        @address.destroy
        return render status: :unprocessable_entity if @address.errors.present?

        render status: :no_content
      end

      def find_address
        @address = Address.by_id(id).first

        render status: :not_found if @address.nil?
      end

      def id
        params[:id]
      end

      def address_params
        params.permit(
          :client_id,
          :postal_code,
          :city,
          :full_address,
          :primary
        )
      end
    end
  end
end
