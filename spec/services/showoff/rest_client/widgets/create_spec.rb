# frozen_string_literal: true

require 'rails_helper'
require 'shared_examples.rb'

RSpec.describe Showoff::RestClient::Widgets::Create, type: :service do
  include_context 'shared examples'

  let(:valid_user) { create_valid_user }
  let(:auth) { login_as(valid_user) }
  let!(:widget) { Wrappers::Widget.new(widget_params) }

  let(:widget_params) do
    {
      'name' => FFaker::Name.name,
      'description' => FFaker::Lorem.sentence,
      'visible' => 'visible'
    }
  end

  let(:opts) do
    {
      widget: widget,
      token: auth[:access_token]
    }
  end

  subject(:create_widget) do
    described_class.new(opts).call
  end

  context 'when widget params are valid' do
    it 'creates the widget' do
      response = create_widget

      expect(response.dig(:message)).to eq 'Success'
    end
  end
end
