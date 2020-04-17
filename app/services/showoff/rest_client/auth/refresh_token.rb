# frozen_string_literal: true

module Showoff
  class RestClient
    module Auth
      class RefreshToken < BaseAction
        ENDPOINT = '/oauth/token'

        attr_accessor :refresh_token

        def initialize(opts)
          @refresh_token = opts.dig(:refresh_token)
        end

        def call
          response = self.class.post(url, options)
          token = response.dig('data', 'token', 'access_token')
          refresh_token = response.dig('data', 'token', 'refresh_token')

          [token, refresh_token]
        end

        def options
          {
            body: app_auth.merge(
              refresh_token: refresh_token,
              grant_type: 'refresh_token'
            )
          }
        end

        def url
          "#{BASE_URI}#{ENDPOINT}"
        end
      end
    end
  end
end
