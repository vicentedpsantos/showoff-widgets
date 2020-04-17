# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples.rb'

RSpec.describe Showoff::RestClient::Auth::AuthenticateUser, type: :service do
  include_context 'shared examples'

  subject(:authenticate_user) do
    described_class.new(
      {
        email: user[:email],
        password: user[:password]
      }
    ).call
  end

  context 'when user exists' do
    context 'when credentials are correct' do
      let(:user) { create_valid_user }

      it 'returns data' do
        response = authenticate_user

        expect(response.dig('data')).to_not be_nil
      end
    end

    context 'when credentials are incorrect' do
      let(:user) do
        {
          email: 'invalidemail@gmail.com',
          password: 'wrongpassword123!'
        }
      end

      it 'does not return data' do
        response = authenticate_user

        expect(response.dig('data')).to be_nil
      end
    end
  end
end
