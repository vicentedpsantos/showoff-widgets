# frozen_string_literal: true

module Showoff
  module BasicAuth
    def app_auth
      {
        'client_id' => Rails.application.credentials.showoff[:client_id],
        'client_secret' => Rails.application.credentials.showoff[:client_secret]
      }
    end
  end
end
