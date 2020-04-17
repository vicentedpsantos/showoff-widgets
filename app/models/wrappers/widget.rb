# frozen_string_literal: true

module Wrappers
  class Widget
    attr_accessor :id, :name, :description, :kind,
                  :user_id, :user_name, :user_images, :user_first_name,
                  :user_last_name

    def initialize(attrs)
      @id = attrs.dig('id')
      @name = attrs.dig('name')
      @description = attrs.dig('description')
      @kind = attrs.dig('visible')
      @user_id = attrs.dig('user', 'id')
      @user_name = attrs.dig('user', 'name')
      @user_images = attrs.dig('user', 'images')
      @user_first_name = attrs.dig('user', 'first_name')
      @user_last_name = attrs.dig('user', 'last_name')
    end
  end
end
