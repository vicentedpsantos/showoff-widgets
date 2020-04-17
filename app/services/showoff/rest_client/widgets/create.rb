# frozen_string_literal: true

module Showoff
  class RestClient
    module Widgets
      class Create < BaseAction
        ENDPOINT = '/api/v1/widgets'
        debug_output $stdout

        attr_accessor :token, :widget

        def initialize(opts)
          @token = opts.dig(:token)
          @widget = opts.dig(:widget)
        end

        def call
          res = self.class.post(url, options)
          message = res.dig('message')

          { message: message }
        end

        def options
          {
            headers: {
              'Authorization' => "Bearer #{token}"
            },
            body: {
              widget: {
                name: widget.name,
                description: widget.description,
                kind: widget.kind
              }
            }
          }
        end

        def url
          "#{BASE_URI}#{ENDPOINT}"
        end
      end
    end
  end
end
