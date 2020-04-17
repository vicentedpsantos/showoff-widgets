# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples.rb'

RSpec.describe Showoff::RestClient::Users::ResetPassword, type: :service do
  include_context 'shared examples'

  let!(:valid_user) { create_valid_user }

  let(:opts) do
    {
      email: email
    }
  end

  subject(:reset_password) do
    described_class.new(opts).call
  end

  context 'when the email is valid' do
    let(:email) { valid_user[:email] }

    it 'starts the reset password flow' do
      response = reset_password

      expect(response.dig('message')).to include 'sent'
    end
  end

  context 'when the email is invalid' do
    let(:email) { 'invalid@email.com' }

    it 'creates the user' do
      response = reset_password

      expect(response.dig('message')).to include 'invalid email'
    end
  end
end
