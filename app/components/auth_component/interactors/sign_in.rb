# frozen_string_literal: true

module AuthComponent
  module Interactors
    class SignIn
      include Interactor

      def call
        return invalid_credential_error unless user

        invalid_credential_error unless user.valid_password?(password)

        context.jwt = user.jwt
      end

      def user
        context.user ||= find_user
      end

      def find_user
        User.by_email(email).first
      end

      def invalid_credential_error
        context.fail!(error: 'invalid credential')
      end

      def email
        context.email
      end

      def password
        context.password
      end
    end
  end
end
