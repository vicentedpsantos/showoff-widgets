# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples.rb'

RSpec.describe Showoff::RestClient::Users::Create, type: :service do
  include_context 'shared examples'

  let(:user_params) do
    {
      first_name: 'Valid',
      last_name: 'User',
      password: 'validpassword123!',
      image_url: 'https://validurl.com',
      email: "validuser#{rand(1..100_000)}@gmail.com"
    }
  end

  subject(:create_user) do
    described_class.new(
      {
        user: user_params
      }
    ).call
  end

  context 'when user params are valid' do
    it 'creates the user' do
      response = create_user

      expect(response.dig(:message)).to eq 'Success'
    end
  end

  context 'when user params are invalid' do
    let(:user_params) do
      {
        first_name: ''
      }
    end

    it 'returns an error message' do
      response = create_user

      expect(response.dig(:message)).to eq 'Email can\'t be blank'
    end
  end
end
