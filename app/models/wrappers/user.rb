# frozen_string_literal: true

module Wrappers
  class User
    attr_accessor :id, :first_name, :last_name, :password,
                  :email, :image_url

    def initialize(attrs = {})
      @id = attrs.dig('id')
      @first_name = attrs.dig(:first_name)
      @last_name = attrs.dig(:last_name)
      @password = attrs.dig(:password)
      @email = attrs.dig(:email)
      @image_url = attrs.dig(:image_url)
    end
  end
end
