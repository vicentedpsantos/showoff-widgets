# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    session['current_token']
  end

  def redirect_unauthenticated
    redirect_to(new_sign_in_path, notice: 'Log in before proceeding') unless current_user
  end

  def redirect_authenticated
    redirect_to '/' and return if current_user
  end

  def refresh_token
    token, refresh_token = Showoff::RestClient.call(
      :refresh_token,
      opts: {
        refresh_token: session['refresh_token']
      }
    )

    session['current_token'] = token
    session['refresh_token'] = refresh_token
  end

  def authenticate(auth)
    session['current_token'] = auth.dig('data', 'token', 'access_token')
    session['refresh_token'] = auth.dig('data', 'token', 'refresh_token')
  end
end
