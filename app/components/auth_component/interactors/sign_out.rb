# frozen_string_literal: true

module AuthComponent
  module Interactors
    class SignOut
      include Interactor

      def call
        context.fail!(error: 'cannot end the current session') unless revoke_jwt
      end

      def revoke_jwt
        payload = JWT.decode(jwt, nil, false)
        JwtDenyList.revoke_jwt(payload.first, nil)
      end

      def jwt
        context.jwt
      end
    end
  end
end
