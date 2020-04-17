# frozen_string_literal: true

module Showoff
  class RestClient
    BASE_URI = 'https://showoff-rails-react-production.herokuapp.com'

    REST_CLIENT_MAP = {
      # AUTH
      refresh_token: Showoff::RestClient::Auth::RefreshToken,
      authenticate_user: Showoff::RestClient::Auth::AuthenticateUser,
      # WIDGETS
      fetch_widgets: Showoff::RestClient::Widgets::Fetch,
      fetch_my_widgets: Showoff::RestClient::Widgets::FetchMine,
      create_widget: Showoff::RestClient::Widgets::Create,
      delete_widget: Showoff::RestClient::Widgets::Delete,
      # USERS
      create_user: Showoff::RestClient::Users::Create,
      reset_password: Showoff::RestClient::Users::ResetPassword
    }.freeze

    def self.call(operation, opts: {})
      REST_CLIENT_MAP[operation].new(opts).call
    end
  end
end
