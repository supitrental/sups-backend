# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApplicationController
      before_action :find_contact, only: %i[show update destroy]

      def index
        @contacts = Contact.all
      end

      def show; end

      def create
        @contact = Contact.create(contact_params)
        render status: :unprocessable_entity if @contact.errors.present?
      end

      def update
        @contact.update(contact_params)
        render status: :unprocessable_entity if @contact.errors.present?
      end

      def destroy
        @contact.destroy
        return render status: :unprocessable_entity if @contact.errors.present?

        render status: :no_content
      end

      def find_contact
        @contact = Contact.by_id(id).first

        render status: :not_found if @contact.nil?
      end

      def id
        params[:id]
      end

      def contact_params
        params.permit(
          :client_id,
          :email,
          :phone_number,
          :full_name,
          :primary
        )
      end
    end
  end
end
