# frozen_string_literal: true

class ResetPasswordsController < ApplicationController
  def new
    @user = Wrappers::User.new
  end

  def create
    Showoff::RestClient.call(:reset_password, opts: { email: reset_params[:email] })

    redirect_to new_sign_in_path, notice: 'Please check your e-mail for further instructions'
  end

  private

  def reset_params
    params.permit(:email)
  end
end
