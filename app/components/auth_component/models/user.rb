# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenyList

  def jwt
    Warden::JWTAuth::UserEncoder.new.call(self, :user, nil).first
  end

  def self.by_jwt(jwt)
    Warden::JWTAuth::UserDecoder.new.call(jwt, :user, nil)
  end

  def self.by_email(email)
    where(email:)
  end
end
