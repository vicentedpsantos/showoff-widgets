# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @widgets = Showoff::RestClient.call(
      :fetch_widgets,
      opts: {
        wrapper: Wrappers::Widget,
        visible: true
      }
    )
  end
end
