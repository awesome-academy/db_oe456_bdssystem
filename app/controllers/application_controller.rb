# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  include SessionsHelper

  def logged_in_user
    return if logged_in?

    flash[:danger] = t "require_login"
    redirect_to login_url
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
