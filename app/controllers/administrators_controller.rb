class AdministratorsController < ApplicationController
  before_action :set_administrator, only: %i[ show edit update destroy ]
  before_action :authenticate_administrator!

  def index
    @administrators = Administrator.all
  end

  def show
  end

  def new
    @administrator = Administrator.new
  end

  def edit
  end

  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to @administrator, notice: "Administrator was successfully created." }
        format.json { render :show, status: :created, location: @administrator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to @administrator, notice: "Administrator was successfully updated." }
        format.json { render :show, status: :ok, location: @administrator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to administrators_url, notice: "Administrator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #==============
  # Custom Methods
  #==============


  #==============
  # Private Methods
  #==============
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administrator_params
      params.require(:administrator).permit(:name)
    end
end
