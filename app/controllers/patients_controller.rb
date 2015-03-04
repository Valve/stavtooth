class PatientsController < ApplicationController
  def index
    @patients = Patient.order(updated_at: :desc).page(params[:page])
  end

  def new
    @patient = Patient.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

end
