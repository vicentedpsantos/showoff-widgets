# frozen_string_literal: true

module Showoff
  class RestClient
    module Widgets
      class Fetch < BaseAction
        ENDPOINT = '/api/v1/widgets'

        attr_accessor :wrapper, :options, :visible

        def initialize(opts)
          @wrapper = opts.fetch(:wrapper, Wrappers::Widget)
          @options = opts.fetch(:options, {})
          @visible = opts.fetch(:visible, false)
        end

        def call
          widgets = self.class.get(url, options.merge!(query: app_auth))['data']['widgets']

          widgets.map { |widget| Wrappers::Widget.new(widget) }
        end

        def url
          "#{BASE_URI}#{ENDPOINT}/#{visible ? 'visible' : ''}"
        end
      end
    end
  end
end
