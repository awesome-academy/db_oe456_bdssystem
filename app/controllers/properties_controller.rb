class PropertiesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create,:edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.newest
                          .page(params[:page])
                          .per(Settings.account.per_page)
  end

  def show; end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = current_account.properties.build(property_params)
    @property.photo.attach(params[:property][:photo])
    if @property.save
      flash[:success] = t ".property_create_success"
      redirect_to @property
    else
      flash[:danger] = t ".create_property_failed"
      render :new
    end
  end

  def update
    if @property.update(property_params)
      flash[:success] = t ".property_update_success"
      redirect_to properties_url
    else
      flash[:danger] = t ".update_property_failed"
      render :edit
    end
  end

  def destroy
    if @property.destroy
      flash[:success] = t ".property_destroy_success"
    else
      flash[:danger] = t ".property_destroy_fail"
    end
    redirect_to properties_url
  end

  private
  def property_params
    params.require(:property).permit(:name, :address, :price, :rooms,
                                     :bathrooms, :photo)
  end

  def correct_user
    @property = current_account.properties.find_by id: params[:id]
    return if @property

    flash[:warning] = t ".invalid_account"
    redirect_to request.referer || root_url
  end
end
