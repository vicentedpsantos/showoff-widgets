# frozen_string_literal: true

module Showoff
  class RestClient
    module Users
      class ResetPassword < BaseAction
        ENDPOINT = '/api/v1/users/reset_password'

        attr_accessor :email

        def initialize(opts)
          @email = opts.fetch(:email)
        end

        def call
          self.class.post(url, options)
        end

        def options
          {
            body: app_auth.merge(
              user: {
                email: email
              }
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
