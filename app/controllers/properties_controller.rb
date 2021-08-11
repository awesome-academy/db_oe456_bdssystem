class PropertiesController < ApplicationController
  def index
    @properties = Property.newest.page(params[:page]).per(Settings.account.per_page)
  end
end
