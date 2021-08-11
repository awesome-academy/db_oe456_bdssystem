class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @properties = Property.all
  end

  def show; end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = current_account.properties.build(property_params)

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
    @property.destroy
    flash[:success] = t ".property_destroy_success"
    redirect_to properties_url
  end

  private
  def set_property
    @property = Property.find_by(id: params[:id])
  end

  def property_params
    params.require(:property).permit(:name,
                                     :address,
                                     :price,
                                     :rooms,
                                     :bathrooms)
  end
end
