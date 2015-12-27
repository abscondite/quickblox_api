require 'spec_helper'

describe QuickbloxApi do
  let(:secrets) { {
    application_id: 1,
    auth_key: 'auth_key',
    auth_secret: 'auth_secret',
    user_owner_id: 1
  }}

  describe 'has a version number' do
    subject { QuickbloxApi::VERSION }

    it { is_expected.to match(/\d+\.\d+\.\d+/) }
  end

  describe '#client' do
    subject { described_class.client(secrets) }

    it { is_expected.to be_a(QuickbloxApi::Client) }
  end

  describe '#user_client' do
    subject { described_class.user_client(
      secrets: secrets,
      login: 'login',
      password: 'password'
    ) }

    it { is_expected.to be_a(QuickbloxApi::UserClient) }
  end
end
