# frozen_string_literal: true

module Showoff
  class RestClient
    module Users
      class Create < BaseAction
        ENDPOINT = '/api/v1/users'

        attr_accessor :user

        def initialize(opts)
          @user = opts.dig(:user)
        end

        def call
          res = self.class.post(url, options)

          { message: res.dig('message') }
        end

        def options
          {
            body: { user: user },
            query: app_auth
          }
        end

        def url
          "#{BASE_URI}#{ENDPOINT}"
        end
      end
    end
  end
end
