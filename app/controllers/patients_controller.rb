class PatientsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index  
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = current_user.patients.build
  end

  def edit
  end

  def create
    @patient = current_user.patients.create(patient_params)
    if @patient.save
      redirect_to @patient, notice: "Patient was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: "Patient was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      # This finds the patient and ensures it belongs to the current user.
      @patient = current_user.patients.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :dob)
    end
end