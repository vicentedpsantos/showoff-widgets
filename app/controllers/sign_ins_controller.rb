# frozen_string_literal: true

class SignInsController < ApplicationController
  def new
    @user = Wrappers::User.new
  end

  def create
    auth = Showoff::RestClient.call(
      :authenticate_user,
      opts: {
        email: login_params['email'],
        password: login_params['password']
      }
    )

    authenticate(auth) and redirect_to widgets_path and return if auth.success?

    redirect_to new_sign_in_path, notice: 'Credentials do not match'
  end

  def destroy
    session['current_token'] = nil

    redirect_to '/'
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
