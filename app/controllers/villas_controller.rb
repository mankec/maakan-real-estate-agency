class VillasController < ApplicationController
  before_action :authenticate_user!, except: %i[ index ]
  before_action :set_villa, only: %i[ show edit update destroy ]

  # GET /villas or /villas.json
  def index
    @villas = Villa.order(:created_at).page(params[:page]).per(Constants.pagination[:properties_per_page])
  end

  # GET /villas/1 or /villas/1.json
  def show
  end

  # GET /villas/new
  def new
    @villa = Villa.new
  end

  # GET /villas/1/edit
  def edit
  end

  # POST /villas or /villas.json
  def create
    @villa = Villa.new villa_params

    if @villa.save
      redirect_to @villa, notice: "Villa has been created."
    else
      flash.now[:alert] = "#{@villa.errors.full_messages.first}."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /villas/1 or /villas/1.json
  def update
    respond_to do |format|
      if @villa.update(villa_params)
        format.html { redirect_to @villa, notice: "Villa was successfully updated." }
        format.json { render :show, status: :ok, location: @villa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @villa.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @villa.destroy!

    respond_to do |format|
      format.html { redirect_to villas_path, status: :see_other, notice: "Villa was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    def set_villa
      @villa = Villa.find(params.expect(:id))
    end

    def villa_params
      params
        .expect(villa: Villa::REQUIRED_FIELDS)
        .merge(
          amenities: [],
          user: current_user
        )
    end
end
