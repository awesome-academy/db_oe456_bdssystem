class AccountsController < ApplicationController
  before_action :load_account, only: [:show, :edit]

  def show; end

  def index
    @account = Account.page(params[:page]).per(Settings.account.per_page)
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      flash[:success] = t ".create_account_success"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  private

  def load_account
    @account = Account.find_by id: params[:id]
    return if @account

    flash[:warning] = t ".account_not_found"
    redirect_to root_path
  end

  def account_params
    params.require(:account)
          .permit(:last_name,
                  :fitst_name,
                  :email,
                  :password,
                  :password_confirmation)
  end
end
