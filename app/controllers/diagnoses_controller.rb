class DiagnosesController < ApplicationController
  def index
    @diagnoses = Diagnosis.order(name: :asc).page(params[:page])
  end

  def new
    @diagnosis = Diagnosis.new
  end
end

