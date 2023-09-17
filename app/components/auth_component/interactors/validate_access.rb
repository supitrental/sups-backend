# frozen_string_literal: true

module AuthComponent
  module Interactors
    class ValidateAccess
      include Interactor

      def call
        return context.fail!(error: 'jwt is blank') unless jwt

        context.payload = validate_jwt

        context.fail!(error: 'jwt revoked') if JwtDenyList.jwt_revoked?(context.payload, nil)
      end

      def validate_jwt
        JWT.decode(jwt, ENV['DEVISE_JWT_SECRET_KEY'], true).first
      rescue JWT::VerificationError
        context.fail!(error: 'invalid jwt signature')
      rescue JWT::ExpiredSignature
        context.fail!(error: 'jwt expired')
      end

      def jwt
        context.jwt
      end
    end
  end
end
