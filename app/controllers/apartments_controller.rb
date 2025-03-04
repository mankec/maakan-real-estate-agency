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

    if @apartment.save
      redirect_to @apartment, notice: "Apartment has been created."
    else
      flash.now[:alert] = "#{@apartment.errors.full_messages.first}."
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @apartment.update apartment_params
      # TODO Refactor this
      @apartment.update! amenities: @apartment.amenities.reject(&:blank?)

      redirect_to @apartment, notice: "Apartment has been updated."
    else
      flash.now[:alert] = "#{@apartment.errors.full_messages.first}."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def apartment_params
    params
      .expect(
        apartment: [
          *Apartment::REQUIRED_FIELDS,
          amenities: []
        ]
      )
      .merge(
        user: current_user
      )
  end

  def set_apartment
    @apartment = Apartment.find params[:id]
  end
end
