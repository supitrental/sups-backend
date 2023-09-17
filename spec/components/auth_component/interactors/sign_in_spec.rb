# frozen_string_literal: true

RSpec.describe AuthComponent::Interactors::SignIn do
  let(:password) { '88888888' }
  let(:user) { create :user, password: }

  it 'should generate jwt when credential is valid' do
    result = described_class.call(email: user.email, password:)

    expect(result).to be_success
    expect(result.jwt).to be_present
  end

  it 'should return error when email is not registered' do
    result = described_class.call(email: 'random@example.com', password:)

    expect(result).to be_failure
    expect(result.error).to eq('invalid credential')
  end

  it 'should return error when password is invalid' do
    result = described_class.call(email: user.email, password: '99999999')

    expect(result).to be_failure
    expect(result.error).to eq('invalid credential')
  end
end
