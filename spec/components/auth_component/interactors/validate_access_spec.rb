# frozen_string_literal: true

RSpec.describe AuthComponent::Interactors::ValidateAccess do
  let(:user) { create :user }
  let(:jwt) { user.jwt }

  it 'should grant access when jwt is valid' do
    result = described_class.call(jwt:)

    expect(result).to be_success
    expect(result.payload['sub']).to eq(user.id.to_s)
  end

  it 'should deny access when jwt is nil' do
    result = described_class.call

    expect(result).to be_failure
    expect(result.error).to eq('jwt is blank')
  end

  it 'should deny access when jwt signature is not valid' do
    payload = { sub: user.id, exp: (Time.zone.now + 1.day).to_i, data: nil }
    bad_jwt = JWT.encode payload, 'wrong secret', 'HS256'
    result = described_class.call(jwt: bad_jwt)

    expect(result).to be_failure
    expect(result.error).to eq('invalid jwt signature')
  end

  it 'should deny access when jwt expired' do
    payload = { sub: user.id, exp: 1.day.ago.to_i, data: nil }
    expired_jwt = JWT.encode payload, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256'
    result = described_class.call(jwt: expired_jwt)

    expect(result).to be_failure
    expect(result.error).to eq('jwt expired')
  end

  it 'should deny access when jwt revoked' do
    payload = JWT.decode(jwt, nil, false)
    JwtDenyList.revoke_jwt(payload.first, nil)

    result = described_class.call(jwt:)

    expect(result).to be_failure
    expect(result.error).to eq('jwt revoked')
  end
end
