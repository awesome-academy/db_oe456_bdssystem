class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.find_by email: params[:session][:email].downcase
    if account&.authenticate(params[:session][:password])
      authenticate account
    else
      flash.now[:danger] = t "invalid_email_password_combination"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  def authenticate account
    log_in account
    redirect_to account
  end
end
