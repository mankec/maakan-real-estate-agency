class TownhousesController < ApplicationController
  before_action :authenticate_user!, except: %i[ index ]
  before_action :set_townhouse, only: %i[ show edit update destroy ]

  def index
    @townhouses = Townhouse.order(:created_at).page(params[:page]).per(Constants.pagination[:properties_per_page])
  end

  def new
    @townhouse = Townhouse.new
  end

  def create
    @townhouse = Townhouse.new townhouse_params
    @townhouse.property = Property.new property_params

    if @townhouse.property.save && @townhouse.save
      redirect_to @townhouse, notice: "Townhouse was successfully created."
    else
      if @townhouse.property.errors.present?
        flash.now[:alert] = "#{@townhouse.property.errors.full_messages.first}."
      else
        flash.now[:alert] = "#{@townhouse.errors.full_messages.first}."
      end

      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @townhouse.property.update(property_params) if params[:property].present?

    if @townhouse.property.errors.blank? && @townhouse.update(townhouse_params)
      redirect_to @townhouse, notice: "Townhouse was successfully updated."
    else
      if @townhouse.property.errors.present?
        flash.now[:alert] = "#{@townhouse.property.errors.full_messages.first}."
      else
        flash.now[:alert] = "#{@townhouse.errors.full_messages.first}."
      end

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @townhouse.destroy!

    redirect_to townhouses_path, notice: "Townhouse was successfully removed."
  end


  private

  def set_townhouse
    @townhouse = Townhouse.find params[:id]
  end

  def property_params
    params.expect(
      property: [
        *Property::REQUIRED_FIELDS,
        amenities: []
      ]
    ).merge(
      property_type: :townhouse,
      user: current_user
    )
  end

  def townhouse_params
    params.expect(townhouse: Townhouse::REQUIRED_FIELDS)
  end
end
