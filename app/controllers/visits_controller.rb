class VisitsController < ApplicationController
  def create
    patient_id = params[:patient_id]
    @visit = Visit.new(visit_params.merge(patient_id: patient_id))
    if @visit.save
      redirect_to patient_path(patient_id)
    else
      @patient = Patient.find(patient_id)
      render 'patients/show'
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:doctor_id, :diagnosis)
  end
end
