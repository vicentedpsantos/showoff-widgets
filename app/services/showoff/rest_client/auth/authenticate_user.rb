# frozen_string_literal: true

module Showoff
  class RestClient
    module Auth
      class AuthenticateUser < BaseAction
        ENDPOINT = '/oauth/token'

        attr_accessor :username, :password

        def initialize(opts)
          @username = opts.fetch(:email)
          @password = opts.fetch(:password)
        end

        def call
          self.class.post(url, options)
        end

        def options
          {
            body: app_auth.merge(
              grant_type: 'password',
              username: username,
              password: password
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
