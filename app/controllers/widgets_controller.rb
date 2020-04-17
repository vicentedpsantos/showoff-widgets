# frozen_string_literal: true

class WidgetsController < ApplicationController
  before_action :redirect_unauthenticated
  before_action :refresh_token

  def index
    @widgets = Showoff::RestClient.call(:fetch_my_widgets, opts: { token: session['current_token'] })
  end

  def new; end

  def create
    widget = Wrappers::Widget.new(widget_params)
    result = Showoff::RestClient.call(:create_widget, opts: { widget: widget, token: session['current_token'] })

    redirect_to widgets_path, notice: result[:message]
  end

  def destroy
    id = delete_params.dig('id')
    result = Showoff::RestClient.call(:delete_widget, opts: { id: id, token: session['current_token'] })

    redirect_to widgets_path, notice: result[:message]
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def widget_params
    params.permit('name', 'description', 'visible')
  end

  def delete_params
    params.permit('id')
  end
end
