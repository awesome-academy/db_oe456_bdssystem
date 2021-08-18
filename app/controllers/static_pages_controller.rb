class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:home]
  before_action :lastest_properties, only: [:home, :lastest]

  def home; end

  def lastest; end

  def blog; end

  def advertising; end

  private
  def lastest_properties
    @properties = Property.newest
                          .page(params[:page])
                          .per(Settings.property.per_page)
  end
end
