# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples.rb'

RSpec.describe Showoff::RestClient::Auth::RefreshToken, type: :service do
  include_context 'shared examples'

  let!(:valid_user) { create_valid_user }
  let!(:tokens) { login_as(valid_user) }

  subject(:refresh_token) do
    described_class.new(
      {
        refresh_token: tokens[:refresh_token]
      }
    ).call
  end

  context 'when refresh token is valid' do
    it 'returns a fresh token' do
      response = refresh_token

      expect(response.all?).not_to be_nil
    end
  end

  context 'when refresh token is not valid' do
    let(:tokens) do
      {
        access_token: 'invalid',
        refresh_token: 'invalid'
      }
    end

    it 'does not return a fresh token' do
      response = refresh_token

      expect(response.first).to be_nil
    end
  end
end
