# frozen_string_literal: true

class SignUpsController < ApplicationController
  before_action :redirect_authenticated

  def new
    @user = Wrappers::User.new
  end

  def create
    creation = Showoff::RestClient.call(:create_user, opts: { user: user_params })

    redirect_to new_sign_in_path, notice: creation.dig(:message)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :image_url)
  end
end
