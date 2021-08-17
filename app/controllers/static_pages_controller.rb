class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:home]
  def home
    @properties = Property.newest
                          .page(params[:page])
                          .per(Settings.property.per_page)
  end

  def lastest; end

  def blog; end

  def advertising; end
end
