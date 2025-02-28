class VillasController < ApplicationController
  before_action :authenticate_user!, except: %i[ index ]
  before_action :set_villa, only: %i[ show edit update destroy ]

  def index
    @villas = Villa.order(:created_at).page(params[:page]).per(Constants.pagination[:properties_per_page])
  end

  def show
  end

  def new
    @villa = Villa.new
  end

  def edit
  end

  def create
    @villa = Villa.new villa_params

    if @villa.save
      redirect_to @villa, notice: "Villa was successfully created."
    else
      flash.now[:alert] = "#{@villa.errors.full_messages.first}."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @villa.update villa_params
      redirect_to @villa, notice: "Villa was successfully updated."
    else
      flash.now[:alert] = "#{@villa.errors.full_messages.first}."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @villa.destroy!

    redirect_to villas_path, notice: "Villa was successfully removed."
  end

  private

  def set_villa
    @villa = Villa.find(params.expect(:id))
  end

  def villa_params
    params
      .expect(
        villa: [
          *Villa::REQUIRED_FIELDS,
          amenities: []
        ]
      )
      .merge(
        user: current_user
      )
  end
end
