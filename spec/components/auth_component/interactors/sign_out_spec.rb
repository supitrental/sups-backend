# frozen_string_literal: true

RSpec.describe AuthComponent::Interactors::SignOut do
  let(:user) { create :user }
  let(:jwt) { user.jwt }

  it 'should revoke jwt' do
    result = described_class.call(jwt:)

    expect(result).to be_success

    payload = JWT.decode(jwt, nil, false)
    expect(JwtDenyList.jwt_revoked?(payload.first, nil)).to be true
  end
end
