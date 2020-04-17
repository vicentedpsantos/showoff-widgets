# frozen_string_literal: true

module Showoff
  class RestClient
    module Widgets
      class FetchMine < BaseAction
        ENDPOINT = '/api/v1/users/me/widgets'

        attr_accessor :token

        def initialize(opts)
          @wrapper = opts.fetch(:wrapper, Wrappers::Widget)
          @token = opts.dig(:token)
        end

        def call
          response = self.class.get(url, options)
          widgets = response.fetch('data', {}).fetch('widgets', [])

          widgets.map { |widget| Wrappers::Widget.new(widget) }
        end

        def options
          {
            query: app_auth,
            headers: { 'Authorization' => "Bearer #{token}" }
          }
        end

        def url
          "#{BASE_URI}#{ENDPOINT}"
        end
      end
    end
  end
end
