# frozen_string_literal: true

module Showoff
  class RestClient
    module Widgets
      class Delete < BaseAction
        ENDPOINT = '/api/v1/widgets'

        attr_accessor :id, :token

        def initialize(opts)
          @id = opts.dig(:id)
          @token = opts.dig(:token)
        end

        def call
          res = self.class.delete(url, options)
          message = res.dig('message')

          { message: message }
        end

        def options
          {
            headers: { 'Authorization' => "Bearer #{token}" }
          }
        end

        def url
          "#{BASE_URI}#{ENDPOINT}/#{id}"
        end
      end
    end
  end
end
