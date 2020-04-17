# frozen_string_literal: true

module Showoff
  class RestClient
    class BaseAction
      include HTTParty
      include Showoff::BasicAuth
    end
  end
end
