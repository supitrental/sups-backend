# frozen_string_literal: true

module Api
  module V1
    class ContractsController < ApplicationController
      before_action :find_contract, only: %i[show update destroy]

      def index
        @contracts = Contract.all
      end

      def show; end

      def create
        @contract = Contract.create(contract_params)
        render status: :unprocessable_entity if @contract.errors.present?
      end

      def update
        @contract.update(contract_params)
        render status: :unprocessable_entity if @contract.errors.present?
      end

      def destroy
        @contract.destroy
        return render status: :unprocessable_entity if @contract.errors.present?

        render status: :no_content
      end

      def find_contract
        @contract = Contract.by_id(id).first

        render status: :not_found if @contract.nil?
      end

      def id
        params[:id]
      end

      def contract_params
        params.permit(
          :client_id,
          :contact_id,
          :address_id,
          :billing_type,
          :billing_term,
          :tax_inclusive,
          :notes
        )
      end
    end
  end
end
