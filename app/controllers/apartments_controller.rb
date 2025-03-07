class ApartmentsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index ]
  before_action :set_apartment, only: %i[ show edit update ]

  def index
    @apartments = Apartment.order(:created_at).page(params[:page]).per(Constants.pagination[:properties_per_page])
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new apartment_params
    @apartment.property = Property.new property_params

    if @apartment.property.save && @apartment.save
      redirect_to @apartment, notice: "Apartment has been created."
    else
      if @apartment.property.errors.present?
        flash.now[:alert] = "#{@apartment.property.errors.full_messages.first}."
      else
        flash.now[:alert] = "#{@apartment.errors.full_messages.first}."
      end

      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @apartment.property.update(property_params) if params[:property].present?

    if @apartment.property.errors.blank? && @apartment.update(apartment_params)
      redirect_to @apartment, notice: "Apartment has been updated."
    else
      if @apartment.property.errors.present?
        flash.now[:alert] = "#{@apartment.property.errors.full_messages.first}."
      else
        flash.now[:alert] = "#{@apartment.errors.full_messages.first}."
      end

      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_apartment
    @apartment = Apartment.find params[:id]
  end

  def property_params
    params.expect(
      property: [
        *Property::REQUIRED_FIELDS,
        amenities: []
      ]
    ).merge(
      user: current_user
    )
  end

  def apartment_params
    params.expect(apartment: Apartment::REQUIRED_FIELDS)
  end
end
